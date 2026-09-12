/// ═══════════════════════════════════════════════════════════════════════════
/// مدد الحركة — أربع مدد فقط من التصميم المرجعي + مدة الـ shimmer
/// ═══════════════════════════════════════════════════════════════════════════
///
/// التصميم يعرّف: instant 80 / fast 140 / standard 220 / deliberate 320.
/// ⚠️ قلّصنا 9 مدد ورثناها من FlutterInit إلى 5 — الانضباط مقصود: خيارات
/// أقل = قرارات أسرع = حركة متسقة في كل التطبيق.
///
/// الاستخدام:
/// ```dart
/// AnimatedContainer(duration: AppDurations.normal, curve: AppCurves.standard)
/// ```
abstract final class AppDurations {
  AppDurations._();

  /// 80ms — لحظي: تبديل حالة أيقونة، استجابة ضغطة فورية.
  /// يقابل --duration-instant في التصميم.
  static const Duration instant = Duration(milliseconds: 80);

  /// 140ms — سريع: العناصر الصغيرة المحتواة (checkbox، chip، شارة).
  /// يقابل --duration-fast.
  static const Duration fast = Duration(milliseconds: 140);

  /// 220ms — القياسي: معظم انتقالات الواجهة (توسّع بطاقة، ظهور قسم).
  /// يقابل --duration-standard (الاسم "normal" اصطلاح Flutter الشائع).
  static const Duration normal = Duration(milliseconds: 220);

  /// 320ms — متأنٍّ: الأسطح الكبيرة (ظهور dialog، انزلاق sheet،
  /// انتقال صفحة كاملة).
  /// يقابل --duration-deliberate.
  static const Duration slow = Duration(milliseconds: 320);

  /// 1350ms — دورة لمعان الـ Skeleton الوهمي (skeletonizer).
  /// مأخوذة من CSS المرجعي: `animation: shimmer 1.35s infinite`.
  static const Duration shimmer = Duration(milliseconds: 1350);

  // ── الأسماء الدلالية — لماذا هذه المدة لا كم تساوي ────────────────────────

  /// الانتقال الموصى به بين الصفحات — متأمل قليلًا ليتنفس الـ push.
  static const Duration pageTransition = slow;

  /// الانتقالات داخل المكان (إظهار/إخفاء ويدجت) — القياسي.
  static const Duration widgetTransition = normal;

  /// التفاعلات الدقيقة (ضغط زر، hover) — السريع.
  static const Duration microInteraction = fast;
}
