import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// أنصاف الأقطار (الاستدارة) — مقابلة مباشرة لتوكنات --radius-* في التصميم
/// ═══════════════════════════════════════════════════════════════════════════
///
/// التطابق مع CSS المرجعي:
///   radius.sm = 8 → [sm]  |  radius.md = 12 → [md]  |  radius.lg = 16 → [lg]
///   radius.xl = 24 → [xl] |  radius.full = 999 → [full]
///
/// لماذا BorderRadius وليس رقمًا؟ لأن أكثر APIs في Flutter تطلب كائن
/// [BorderRadius] جاهزًا، فتوفيره هنا يغنيك عن BorderRadius.circular(12)
/// المكرر في كل ملف.
///
/// الاستخدام:
/// ```dart
/// Container(decoration: BoxDecoration(borderRadius: AppBorders.card))
/// shape: RoundedRectangleBorder(borderRadius: AppBorders.button),
/// ```
abstract final class AppBorders {
  AppBorders._();

  // ── أنصاف الأقطار الأساسية ────────────────────────────────────────────────

  /// 4 — استدارة دقيقة. (موجودة في النظام لكن التصميم المرجعي لا يستخدمها —
  /// أبقيناها لاستخدامات محتملة مستقبلًا كحد أدنى للإدخالات الصغيرة).
  static const BorderRadius xs = BorderRadius.all(Radius.circular(4));

  /// 8 — يقابل radius.sm: عناصر صغيرة مضغوطة (خلايا OTP، عناصر مؤشرات).
  static const BorderRadius sm = BorderRadius.all(Radius.circular(8));

  /// 12 — يقابل radius.md: **الأزرار وحقول الإدخال** في تصميمنا
  /// (.button و .input-shell يستخدمان radius-md).
  static const BorderRadius md = BorderRadius.all(Radius.circular(12));

  /// 16 — يقابل radius-lg: **البطاقات والصفوف** (.surface, .doctor-card,
  /// .list-row — كلها radius-lg).
  static const BorderRadius lg = BorderRadius.all(Radius.circular(16));

  /// 24 — يقابل radius-xl: العناصر البطولية الكبيرة (feature-panel،
  /// confirmation-hero، profile-hero) والحوارات.
  static const BorderRadius xl = BorderRadius.all(Radius.circular(24));

  /// 28 — قمة الـ BottomSheet في Material 3 (قيمة إطار عمل قياسية،
  /// وليست من توكنات التصميم).
  static const BorderRadius bottomSheet = BorderRadius.vertical(
    top: Radius.circular(28),
  );

  /// 999 — الاستدارة الكاملة (حبّة/دوّالة): الشارات badge، الـ chips،
  /// حاوية أيقونة التاب النشط في شريط التنقل السفلي.
  static const BorderRadius full = BorderRadius.all(Radius.circular(999));

  // ── الأسماء الدلالية — الصلة بين "ما هو العنصر" و"كم استدارته" ───────────
  //
  // ⚠️ تاريخية مهمة: هذه الـ aliases صُححت لتطابق التصميم المرجعي —
  // كانت معكوسة من FlutterInit (button=16, card=12) وهو عكس CSS!

  /// استدارة الزر — 12 (radius-md، يطابق .button في CSS).
  static const BorderRadius button = md;

  /// استدارة البطاقة — 16 (radius-lg، يطابق .surface في CSS).
  static const BorderRadius card = lg;

  /// استدارة حقل الإدخال — 12 (radius-md، يطابق .input-shell في CSS).
  static const BorderRadius input = md;

  /// استدارة الحوار — 24 (radius-xl).
  static const BorderRadius dialog = xl;

  // ── أشكال جاهزة للـ ShapeBorder (بعض APIs تطلب Shape لا BorderRadius) ────

  /// شكل مستطيل مستدير — استدارة صغيرة (8).
  static const RoundedRectangleBorder shapeSm = RoundedRectangleBorder(
    borderRadius: sm,
  );

  /// شكل مستطيل مستدير — استدارة متوسطة (12) — الأزرار والحقول.
  static const RoundedRectangleBorder shapeMd = RoundedRectangleBorder(
    borderRadius: md,
  );

  /// شكل مستطيل مستدير — استدارة كبيرة (16) — البطاقات.
  static const RoundedRectangleBorder shapeLg = RoundedRectangleBorder(
    borderRadius: lg,
  );

  /// الشكل الكبسولي/الدوّال — الشارات والـ chips.
  static const StadiumBorder stadium = StadiumBorder();
}
