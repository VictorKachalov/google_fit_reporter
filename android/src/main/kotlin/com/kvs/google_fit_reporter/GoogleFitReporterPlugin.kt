package com.kvs.google_fit_reporter

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import com.kvs.googlefitreporter.*
import com.kvs.googlefitreporter.model.*

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.*
import io.flutter.plugin.common.*
import io.flutter.plugin.common.MethodChannel.*
import java.lang.Exception

/** GoogleFitReporterPlugin */
class GoogleFitReporterPlugin : FlutterPlugin, MethodCallHandler,
    EventChannel.StreamHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    internal enum class Method(val string: String) {
        HAS_PERMISSIONS("hasPermissions"),
        REQUEST_PERMISSIONS("requestPermissions"),
        AGGREGATE("aggregate"),
        READ("read"),
        INSERT("insert"),
        UPDATE("update"),
        DELETE("delete");

        companion object {
            fun initWith(string: String): Method? {
                return when (string) {
                    HAS_PERMISSIONS.string -> HAS_PERMISSIONS
                    REQUEST_PERMISSIONS.string -> REQUEST_PERMISSIONS
                    AGGREGATE.string -> AGGREGATE
                    READ.string -> READ
                    INSERT.string -> INSERT
                    UPDATE.string -> UPDATE
                    DELETE.string -> DELETE
                    else -> null
                }
            }
        }
    }

    internal enum class ErrorCode(val id: String) {
        REPORTER("1000"),
        AUTH("1001"),
        DATA("1002"),
        READ("1003"),
        WRITE("1004"),
        METHOD("1005"),
        TYPE("1006");
    }

    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel

    private var reporter: GoogleFitReporter? = null
    private var activity: Activity? = null
    private var result: Result? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        activity?.let { a ->
            reporter = GoogleFitReporter(a)
            val binaryMessenger = flutterPluginBinding.binaryMessenger
            methodChannel = MethodChannel(
                binaryMessenger,
                "google_fit_reporter_method_channel"
            )
            methodChannel.setMethodCallHandler(this)
            eventChannel = EventChannel(
                binaryMessenger,
                "google_fit_reporter_event_channel_permissions"
            )
            eventChannel.setStreamHandler(this)
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val reporter = reporter
        if (reporter != null) {
            val callMethod = call.method
            val method = Method.initWith(callMethod)
            if (method != null) {
                when (method) {
                    Method.HAS_PERMISSIONS -> hasPermissions(reporter, call, result)
                    Method.REQUEST_PERMISSIONS -> requestPermissions(reporter, result)
                    Method.AGGREGATE -> aggregate(reporter, call, result)
                    Method.READ -> read(reporter, call, result)
                    Method.INSERT -> insert(reporter, call, result)
                    Method.UPDATE -> update(reporter, call, result)
                    Method.DELETE -> delete(reporter, call, result)
                }
            } else {
                result.error(
                    ErrorCode.METHOD.id,
                    "Method is NULL",
                    callMethod
                )
            }
        } else {
            result.error(
                ErrorCode.REPORTER.id,
                "Reporter is NULL",
                null
            )
        }
    }

    private fun hasPermissions(
        reporter: GoogleFitReporter,
        call: MethodCall,
        result: Result
    ) {
        this.result = result
        val toReadArguments = call.argument("toRead") as? List<String>
        val toWriteArguments = call.argument("toWrite") as? List<String>
        try {
            val hasPermissions = reporter.manager.hasPermissions(
                toReadTypes = if (toReadArguments != null) parse(toReadArguments) else setOf(),
                toWriteTypes = if (toWriteArguments != null) parse(toWriteArguments) else setOf()
            )
            this.result?.success(hasPermissions)
        } catch (e: GoogleFitRequestPermissionsException) {
            this.result?.error(ErrorCode.AUTH.id, "hasPermissions", e)
        }
    }

    private fun requestPermissions(
        reporter: GoogleFitReporter,
        result: Result
    ) {
        this.result = result
        try {
            reporter.manager.requestPermissions()
            this.result?.success(null)
        } catch (e: GoogleFitRequestPermissionsException) {
            this.result?.error(ErrorCode.AUTH.id, "requestPermissions", e)
        }
    }

    private fun aggregate(
        reporter: GoogleFitReporter,
        call: MethodCall,
        result: Result
    ) {
        try {
            val type = call.argument("aggregateType") as? String
            val startTime = call.argument("startTime") as? Long
            val endTime = call.argument("endTime") as? Long
            if (type != null && endTime != null && startTime != null) {
                val healthType = HealthType.createFrom(type)
                if (healthType is AggregateType) {
                    val jsonArray = reporter.reader.aggregate(healthType, startTime, endTime).map { it.json }
                    result.success(jsonArray)
                } else {
                    result.error(ErrorCode.TYPE.id, "aggregate", GoogleFitDataTypeException("invalid aggregate health type: ${healthType.string}"))
                }
            } else {
                result.error(ErrorCode.DATA.id, "aggregate", GoogleFitDataTypeException("invalid arguments from call: ${call.arguments}"))
            }
        } catch (e: Exception) {
            result.error(ErrorCode.READ.id, "aggregate", e)
        } catch (e: GoogleFitDataTypeException) {
            result.error(ErrorCode.TYPE.id, "aggregate", e)
        }
    }

    private fun read(
        reporter: GoogleFitReporter,
        call: MethodCall,
        result: Result
    ) {
        try {
            val type = call.argument("healthType") as? String
            val startTime = call.argument("startTime") as? Long
            val endTime = call.argument("endTime") as? Long
            if (type != null && endTime != null && startTime != null) {
                val healthType = HealthType.createFrom(type)
                val jsonArray = reporter.reader.read(healthType, startTime, endTime).map { it.json }
                result.success(jsonArray)
            } else {
                result.error(ErrorCode.DATA.id, "read", GoogleFitDataTypeException("invalid arguments from call: ${call.arguments}"))
            }
        } catch (e: Exception) {
            result.error(ErrorCode.READ.id, "read", e)
        }
    }

    private fun insert(
        reporter: GoogleFitReporter,
        call: MethodCall,
        result: Result
    ) {
        try {
            val payload = call.argument("insertResult") as? String
            if (payload != null) {
                val insertResult = InsertResult.createFrom(payload)
                val isInserted = reporter.writer.insert(insertResult)
                result.success(isInserted)
            } else {
                result.error(ErrorCode.DATA.id, "insert", GoogleFitDataTypeException("invalid arguments from call: ${call.arguments}"))
            }
        } catch (e: Exception) {
            result.error(ErrorCode.WRITE.id, "insert", e)
        }
    }

    private fun update(
        reporter: GoogleFitReporter,
        call: MethodCall,
        result: Result
    ) {
        try {
            val payload = call.argument("insertResult") as? String
            val startTime = call.argument("startTime") as? Long
            val endTime = call.argument("endTime") as? Long
            if (payload != null && startTime != null && endTime != null) {
                val insertResult = InsertResult.createFrom(payload)
                val isUpdated = reporter.writer.update(insertResult, startTime, endTime)
                result.success(isUpdated)
            } else {
                result.error(ErrorCode.DATA.id, "update", GoogleFitDataTypeException("invalid arguments from call: ${call.arguments}"))
            }
        } catch (e: Exception) {
            result.error(ErrorCode.WRITE.id, "update", e)
        }
    }

    private fun delete(
        reporter: GoogleFitReporter,
        call: MethodCall,
        result: Result
    ) {
        try {
            val type = call.argument("detailType") as? String
            val startTime = call.argument("startTime") as? Long
            val endTime = call.argument("endTime") as? Long
            if (type != null && startTime != null && endTime != null) {
                val healthType = HealthType.createFrom(type)
                if (healthType is DetailType) {
                    val isDeleted = reporter.writer.delete(healthType, startTime, endTime)
                    result.success(isDeleted)
                } else {
                    result.error(ErrorCode.TYPE.id, "delete", GoogleFitDataTypeException("invalid detail health type: ${healthType.string}"))
                }
            } else {
                result.error(ErrorCode.DATA.id, "delete", GoogleFitDataTypeException("invalid arguments from call: ${call.arguments}"))
            }
        } catch (e: Exception) {
            result.error(ErrorCode.WRITE.id, "delete", e)
        }
    }

    private fun parse(arguments: List<String>): Set<HealthType> {
        val set = mutableSetOf<HealthType>()
        for (element in arguments) {
            try {
                val type = HealthType.createFrom(element)
                set.add(type)
            } catch (exception: Exception) {
                continue
            }
        }
        return set
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {

    }

    override fun onCancel(arguments: Any?) {

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        setActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        clear()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        setActivity(binding)
    }

    override fun onDetachedFromActivity() {
        clear()
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == GoogleFitManager.GOOGLE_FIT_REPORTER_PERMISSIONS_REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                result?.success(true)
            } else if (resultCode == Activity.RESULT_CANCELED) {
                result?.success(false)
            }
        }
        return false
    }

    private fun setActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    private fun clear() {
        result = null
        activity = null
    }
}
