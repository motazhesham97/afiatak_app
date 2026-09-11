import 'package:flutter/material.dart';

/// App-specific colors that aren't part of the standard [ColorScheme].
/// Access via `context.appColors` (defined in `context_extension.dart`).
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    this.successContainer,
    this.onSuccessContainer,
    this.warningContainer,
    this.onWarningContainer,
    this.infoContainer,
    this.onInfoContainer,
    required this.hold,
    required this.onHold,
    this.holdContainer,
    this.onHoldContainer,
  });

  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;
  final Color? successContainer;
  final Color? onSuccessContainer;
  final Color? warningContainer;
  final Color? onWarningContainer;
  final Color? infoContainer;
  final Color? onInfoContainer;
  final Color hold;
  final Color onHold;
  final Color? holdContainer;
  final Color? onHoldContainer;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? hold,
    Color? onHold,
    Color? holdContainer,
    Color? onHoldContainer,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      hold: hold ?? this.hold,
      onHold: onHold ?? this.onHold,
      holdContainer: holdContainer ?? this.holdContainer,
      onHoldContainer: onHoldContainer ?? this.onHoldContainer,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t),
      onSuccessContainer: Color.lerp(onSuccessContainer, other.onSuccessContainer, t),
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t),
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t),
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t),
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t),
      hold: Color.lerp(hold, other.hold, t)!,
      onHold: Color.lerp(onHold, other.onHold, t)!,
      holdContainer: Color.lerp(holdContainer, other.holdContainer, t),
      onHoldContainer: Color.lerp(onHoldContainer, other.onHoldContainer, t),
    );
  }
}

/// Helper class to define the actual color palettes
class AppPalettes {
  AppPalettes._();

  static const light = AppColorsExtension(
    success: Color(0xFF800020),
    onSuccess: Color(0xFFFFFFFF),
    successContainer: Color(0xFFF7E9EC),
    onSuccessContainer: Color(0xFF5C0016),
    warning: Color(0xFF1A1A1A),
    onWarning: Color(0xFFFFFFFF),
    warningContainer: Color(0xFFEFEFEF),
    onWarningContainer: Color(0xFF1A1A1A),
    info: Color(0xFF1A1A1A),
    onInfo: Color(0xFFFFFFFF),
    infoContainer: Color(0xFFEFEFEF),
    onInfoContainer: Color(0xFF1A1A1A),
    hold: Color(0xFF800020),
    onHold: Color(0xFFFFFFFF),
    holdContainer: Color(0xFFF7E9EC),
    onHoldContainer: Color(0xFF5C0016),
  );

  static const dark = AppColorsExtension(
    success: Color(0xFF81C784),
    onSuccess: Color(0xFF003300),
    successContainer: Color(0xFF1B5E20),
    onSuccessContainer: Color(0xFFA5D6A7),
    warning: Color(0xFFFFB74D),
    onWarning: Color(0xFF5D4037),
    warningContainer: Color(0xFFE65100),
    onWarningContainer: Color(0xFFFFCC80),
    info: Color(0xFF4FC3F7),
    onInfo: Color(0xFF01579B),
    infoContainer: Color(0xFF0277BD),
    onInfoContainer: Color(0xFFE1F5FE),
    hold: Color(0xFF800020),
    onHold: Color(0xFFFFFFFF),
    holdContainer: Color(0xFFF7E9EC),
    onHoldContainer: Color(0xFF5C0016),
  );
}

/// Access semantic colors via `context.appColors` from `context_extension.dart`.
/// Example: `context.appColors.success`
