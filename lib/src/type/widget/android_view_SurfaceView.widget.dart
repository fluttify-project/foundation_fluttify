// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_view.dart';

typedef Future<void> OnViewCreated(android_view_SurfaceView controller);
typedef Future<void> _OnViewDispose();

class android_view_SurfaceViewWidget extends StatefulWidget {
  const android_view_SurfaceViewWidget({
    Key key,
    this.onSurfaceViewCreated,
    this.onDispose,
  }) : super(key: key);

  final OnViewCreated onSurfaceViewCreated;
  final _OnViewDispose onDispose;

  @override
  _android_view_SurfaceViewWidgetState createState() =>
      _android_view_SurfaceViewWidgetState();
}

class _android_view_SurfaceViewWidgetState
    extends State<android_view_SurfaceViewWidget> {
  android_view_SurfaceView _view;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AndroidView(
        viewType: 'me.yohom/foundation_fluttify/android.view.SurfaceView',
        onPlatformViewCreated: (viewId) async {
          final refId = await viewId2RefId((2147483647 - viewId).toString());
          _view = android_view_SurfaceView()
            ..refId = refId
            ..tag__ = 'platform';
          if (widget.onSurfaceViewCreated != null) {
            widget.onSurfaceViewCreated(_view);
          }
        },
      );
    } else {
      return Center(child: Text('不支持的平台'));
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose().then((_) => _view.release__());
    } else {
      _view.release__();
    }
    super.dispose();
  }
}