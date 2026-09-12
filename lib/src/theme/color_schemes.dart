import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// الألوان الدلالية الخاصة بتطبيق عافيتك (خارج نظام ColorScheme القياسي)
/// ═══════════════════════════════════════════════════════════════════════════
///
/// هذا الملف يعرّف ألوان "الحالات الدلالية" (نجاح/تحذير/معلومة/حجز مؤقت)
/// التي لا يوفرها نظام Material القياسي، ويمتد بـ [ThemeExtension] ليصبح
/// جزءًا من الثيم ويتبع انتقالات الثيم تلقائيًا.
///
/// ─── كيف نصل إلى هذه الألوان من أي ويدجت؟ ───
///
///   context.appColors.success       // لون النجاح
///   context.appColors.holdContainer // خلفية بانر الحجز المؤقت
///
/// (الامتداد `context.appColors` معرّف في `context_extension.dart`).
///
/// ─── القاعدة الذهبية في تصميم عافيتك: "الأحادية البورجوندية" ───
///
/// ⚠️ اللون لا يحمل معنى الحالة أبدًا!
///   - النجاح والاحتفال  → بورجوندي العلامة (#800020)
///   - التحذير والمعلومة → فحمي محايد (#1A1A1A)
///   - الخطأ             → فحمي داكن (#1F1F1F) — لا أحمر!
/// المعنى تتحمله الأيقونة والنص، لا الصبغة اللونية. هذا قرار تصميم مقصود
/// (تطبيق طبي: لا نريد إثارة قلق المريض بألوان تحذير صارخة).
/// لا تضف لونًا رابعًا (أخضر/أصفر/أحمر) تحت أي ظرف.
///
/// ─── بنية كل زوج لوني ───
///
/// لكل حالة 4 قيم تفهمها هكذا (مثال بـ hold):
///   hold           → اللون الأساسي للحالة (نص/أيقونة فوق خلفية فاتحة)
///   onHold         → لون المحتوى فوق اللون الأساسي (أبيض فوق البورجوندي)
///   holdContainer  → الخلفية الفاتحة (شريحة/بانر/شارة)
///   onHoldContainer→ لون المحتوى فوق الخلفية الفاتحة
///
/// قاعدة التسمية مستعارة من Material: بادئة "on" تعني "لون المحتوى الذي
/// يجلس فوق هذا اللون" — مثال: نص فوق زر بورجوندي = onPrimary أبيض.
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

  /// لون النجاح — بورجوندي العلامة #800020.
  /// أين يُستخدم؟ شارة "تم التأكيد"، أيقونة نجاح في StatusBlock، إشعار إيجابي.
  /// (التزامًا بالأحادية: النجاح بلون العلامة نفسه، لا بأخضر Material).
  final Color success;

  /// لون المحتوى فوق [success] — أبيض.
  /// مثال: نص شارة نجاح إذا كانت بخلفية بورجوندية صريحة.
  final Color onSuccess;

  /// لون التحذير — فحمي #1A1A1A (ليس أصفر/برتقالي — راجع قاعدة الأحادية أعلاه).
  /// أين يُستخدم؟ "آخر مقعد متاح"، تنبيه انتهاء الحجز المؤقت، يوم بتوفر محدود
  /// في شريط الأيام (day.warning في التصميم).
  final Color warning;

  /// لون المحتوى فوق [warning] — أبيض.
  final Color onWarning;

  /// لون المعلومة — فحمي محايد #1A1A1A.
  /// أين يُستخدم؟ إشعار "أنت غير متصل الآن" في الرئيسية، ملاحظات الملاحة.
  final Color info;

  /// لون المحتوى فوق [info] — أبيض.
  final Color onInfo;

  /// لون الحجز المؤقت (Hold) — بورجوندي #800020 (نفس عائلة النجاح لأنه
  /// خبر إيجابي: "حجزنا السعة لك").
  /// أين يُستخدم؟ بانر العد التنازلي أعلى شاشة الدفع (hold-banner في التصميم).
  final Color hold;

  /// لون المحتوى فوق [hold] — أبيض.
  final Color onHold;

  // ── نسخ الحاويات الفاتحة (nullable لأن بعض الويدجتات قد لا تحتاجها،
  //    لكن القيم نفسها معبأة دائمًا في AppPalettes.light أدناه) ──

  /// خلفية النجاح الفاتحة — #F7E9EC (بورجوندي بشفافية ~8% على أبيض).
  final Color? successContainer;

  /// المحتوى فوق [successContainer] — #5C0016 (بورجوندي غامق).
  final Color? onSuccessContainer;

  /// خلفية التحذير الفاتحة — #EFEFEF (رمادي الحاويات المحايد).
  final Color? warningContainer;

  /// المحتوى فوق [warningContainer] — فحمي.
  final Color? onWarningContainer;

  /// خلفية المعلومة الفاتحة — #EFEFEF.
  final Color? infoContainer;

  /// المحتوى فوق [infoContainer] — فحمي.
  final Color? onInfoContainer;

  /// خلفية الحجز المؤقت الفاتحة — #F7E9EC (خلفية بانر العد التنازلي).
  final Color? holdContainer;

  /// المحتوى فوق [holdContainer] — #5C0016.
  final Color? onHoldContainer;

  /// ═══════════════════════════════════════════════════════════════════
  /// [copyWith] — نسخ الكائن مع تجاوز حقول محددة فقط.
  /// لماذا نحتاجها؟ Flutter يستدعيها داخليًا عند تفريع الثيم، ونحن
  /// نستخدمها إن أردنا مشتقًا معدلًا من الألوان في مكان واحد.
  /// القاعدة: أي حقل جديد تضيفه هنا → يجب أن يظهر في 4 مواضع:
  /// الحقول ← constructor ← copyWith ← lerp (وإلا كسرت الامتداد).
  /// ═══════════════════════════════════════════════════════════════════
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

  /// ═══════════════════════════════════════════════════════════════════
  /// [lerp] — المزج الخطي بين نسختين من الألوان (القديمة و t الجديدة).
  /// متى تُستدعى؟ عند تغيّر الثيم أثناء التشغيل (مثلًا: تبديل الوضع الداكن
  /// مستقبلًا) — Flutter يمزج كل لون تدريجيًا عبر أنيميشن الانتقال بدل
  /// القفزة المفاجئة. لو نسيت حقلًا هنا فلن يُمزج: سيظهر لونًا قديمًا
  /// متجمدًا وسط ألوان تتحول بنعومة — خطأ بصري يظهر فقط أثناء الحركة.
  /// ═══════════════════════════════════════════════════════════════════
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

/// ═══════════════════════════════════════════════════════════════════════════
/// اللوحات الفعلية — القيم الحرفية للوضعين الفاتح والداكن
/// ═══════════════════════════════════════════════════════════════════════════
///
/// هذا هو "سجل المصدر" لألوان الحالات الدلالية — المكان الوحيد الذي
/// يملك حق كتابة القيم الست عشرية صراحة (الويدجتات لا تملك هذا الحق أبدًا).
class AppPalettes {
  AppPalettes._();

  /// لوحة الوضع الفاتح — مطابقة لتوكنات التصميم المرجعي (tokens.css):
  /// نجاح/حجز = بورجوندي، تحذير/معلومة = فحمي، حاويات = F7E9EC / EFEFEF.
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

  /// لوحة الوضع الداكن — ⚠️ مؤقتًا قيم Material القديمة (أخضر/برتقالي/أزرق).
  /// التطبيق مقفل حاليًا على الوضع الفاتح (ThemeMode.light في app.dart)،
  /// وعند تصميم النسخة الداكنة رسميًا سنعيد تعريف هذه اللوحة بالأحادية
  /// (بورجوندي أفتح/فحمي أفتح للتباين على الخلفيات الداكنة).
  /// لا تستخدم هذه القيم كمرجع — ليست معتمدة من التصميم بعد.
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

/// الوصول للألوان الدلالية من أي ويدجت:
///   context.appColors.success
///   context.appColors.holdContainer!
/// (الامتداد معرّف في `context_extension.dart`).
/// ملاحظة: الألوان القياسية (primary/onPrimary/surface/...) ليست هنا —
/// تعيش في ColorScheme داخل `theme.dart`، وشرحها هناك.
