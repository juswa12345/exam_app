import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          {required Widget content,
          EdgeInsetsGeometry? margin,
          EdgeInsetsGeometry? padding,
          Duration duration = const Duration(milliseconds: 1000)}) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: content,
          behavior: SnackBarBehavior.floating,
          margin: margin,
          padding: padding,
          duration: duration,
        ),
      );
}
