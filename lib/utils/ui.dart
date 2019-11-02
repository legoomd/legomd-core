import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiUtil {
  static showSnackBar(BuildContext context, {Widget content, String text}) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black54,
        content: content ?? Text(text ?? "敬请期待")));
  }

  static progressIndicator() {
    return Center(
      child: new SizedBox(
          width: 24.0,
          height: 24.0,
          child:
//          AnimatedRotationBox(
//            duration: Duration(milliseconds: 800),
//            child: Icon(
//              Icons.refresh,
//              color: Colors.blue,
//            ),
//          )
          CircularProgressIndicator(
            strokeWidth: 2.0,
          )),
    );
  }

  static systemStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white10,
        systemNavigationBarDividerColor: Colors.white10,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static systemUiOverlay({List<SystemUiOverlay> values, bool over = false}) {
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      if (!over) {
        systemStyle();
      }
      SystemChrome.setEnabledSystemUIOverlays(
          over ? [] : values ?? SystemUiOverlay.values);
    }
  }
}