import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/content/context.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/content/intent.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class android_app_Activity extends android_content_Context {
  static Future<android_app_Activity> get() async {
    final Ref result =
        await kMethodChannel.invokeMethod('android.app.Activity::get');
    return android_app_Activity()
      ..refId = result.refId
      ..tag__ = 'platform';
  }

  Future<android_content_Intent> get intent async {
    final Ref result = await kMethodChannel
        .invokeMethod('android.app.Activity::getIntent', {'__this__': this});
    return android_content_Intent()
      ..refId = result.refId
      ..tag__ = 'platform';
  }
}
