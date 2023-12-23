import 'dart:async';

import 'package:f_logs/f_logs.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

class LogUtils {
  static const String _TAG = "LogUtils";

  static bool _logsEnabled = true;
  static Completer _completer = new Completer<String>();
  static late BuildContext context;

  static void printAllLogs() => FLog.printFileLogs();

  static Future<String> exportLogs(BuildContext context) async {
    logInfo(_TAG, "exportLogs", "<------------------------------>");
    logInfo(_TAG, "exportLogs", "<------------------------------>");
    logInfo(_TAG, "exportLogs", "Sending logs..");
    FLog.exportLogs();

    Future.delayed(const Duration(milliseconds: 200), () async {
      // Do something
      // Upload Logs file to Firebase or API
    });

    LogUtils.context = context;
    return _completer.future as FutureOr<String>;
  }

  static void logInfo(String className, String methodName, dynamic message) {
    if (!_logsEnabled) return;
    FLog.info(className: className, methodName: methodName, text: message);
  }

  static void logError(
      String className, String methodName, String message, dynamic error) {
    if (!_logsEnabled) return;

    FLog.error(
        className: className,
        methodName: methodName,
        text: message,
        exception: error);
  }

  static void logException(String className, String methodName, String message,
      Exception exception) {
    if (!_logsEnabled) return;

    FLog.severe(
        className: className,
        methodName: methodName,
        text: message,
        exception: exception);
  }

  static void logWarn(String className, String methodName, String message) {
    if (!_logsEnabled) return;

    FLog.warning(className: className, methodName: methodName, text: message);
  }

  static void logErrorSimple(
      String className, String methodName, String message) {
    if (!_logsEnabled) return;

    FLog.trace(className: className, methodName: methodName, text: message);
  }

  static void logFirebaseCrash(dynamic e, dynamic s, String reason) async {
    await FirebaseCrashlytics.instance.recordError(e, s, reason: reason);
  }

  static void setAppVersion(String appVersion) async {
    // await FirebaseCrashlytics.instance.setCustomKey('appVersion', appVersion);
  }

  static void setUserId(String userId) async {
    // await FirebaseCrashlytics.instance.setCustomKey('userId', userId);
  }
}
