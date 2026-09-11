/// Named animation duration constants following Material 3 motion guidelines.
///
/// Usage:
/// ```dart
/// AnimatedContainer(duration: AppDurations.normal, curve: AppCurves.standard)
/// ```
abstract final class AppDurations {
  AppDurations._();

  /// 50 ms — nearly instant, icon state swaps.
  static const Duration instant = Duration(milliseconds: 80);


  /// 150 ms — fast transition for small, contained elements (checkboxes, chips).
  static const Duration fast = Duration(milliseconds: 140);



  /// 300 ms — standard transition for most UI animations.
  /// Follows Material 3 "standard" motion duration guideline.
  static const Duration normal = Duration(milliseconds: 220);



  /// 500 ms — slow, deliberate reveal of large surfaces (drawers, dialogs).
  static const Duration slow = Duration(milliseconds: 320);



  /// 1000 ms — skeleton/shimmer cycle base duration.
  static const Duration shimmer = Duration(milliseconds: 1350);

  // ── Semantic aliases ──────────────────────────────────────────────────────

  /// Recommended duration for page transitions.
  static const Duration pageTransition = slow;

  /// Recommended duration for in-place widget transitions (show/hide).
  static const Duration widgetTransition = normal;

  /// Recommended duration for micro-interactions (button press, hover).
  static const Duration microInteraction = fast;
}
