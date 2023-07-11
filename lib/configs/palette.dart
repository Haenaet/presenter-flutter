import 'package:flutter/material.dart';

/// [Palette] 클래스는 앱에서 사용되는 색상을 포함하고 있어요.
class Palette {
  /// - [primaryColor]는 앱의 기본 컬러입니다.
  /// - [Color], [ColorScheme.surface], [ColorScheme.background]
  static const primaryColor = Color(0xff1A1A1A);

  /// - [onPrimaryColor]는 [primaryColor] 위에 표시되는 컬러입니다.
  /// - [Text.style], [Icon.color]
  static const onPrimaryColor = Color(0xffF5F5F5);

  /// - [secondaryColor]는 앱의 보조 컬러입니다.
  /// - 강조할 필요가 없는 요소에 사용할 수 있어요.
  /// - [Text.style], [Icon.color]
  static const secondaryColor = Color(0xff999999);

  /// - [tertiaryColor]는 앱의 보조 컬러입니다.
  /// - [primaryColor]와 대비를 이루기 위해 사용할 수 있어요.
  /// - [Color], [ColorScheme.surface], [ColorScheme.background]
  static const tertiaryColor = Color(0xff333333);
}
