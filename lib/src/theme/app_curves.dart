import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// منحنيات الحركة — "شخصية" تسارع وتباطؤ الأنيميشن
/// ═══════════════════════════════════════════════════════════════════════════
///
/// المدة (AppDurations) تجيب "كم يستغرق؟" — والمنحنى يجيب "كيف يتسارع؟".
/// نفس المدة بمنحنيين مختلفين تعطي إحساسين مختلفين تمامًا: منحنى الخطي
/// آلي وممل، والمنحنيات المبطأة (eased) تبدو طبيعية كحركة الأشياء الفيزيائية.
///
/// عائلات Material 3 الأساسية الأربع، يقابلها التصميم بقيم cubic-bezier
/// في tokens.css (--ease-standard / decelerate / accelerate):
/// - **Standard** — معظم انتقالات الواجهة (دخول وخروج معًا)
/// - **Emphasized** — الانتقالات المهمة/المعبّرة
/// - **Decelerate** — للعناصر الداخلة للشاشة (تبدأ سريعة وتنعّم للتوقف)
/// - **Accelerate** — للعناصر الخارجة من الشاشة (تبدأ بطيئة وتتسارع للخروج)
///
/// الاستخدام:
/// ```dart
/// AnimatedContainer(
///   duration: AppDurations.normal,
///   curve: AppCurves.standard,
/// )
/// ```
abstract final class AppCurves {
  AppCurves._();

  // ── منحنيات Material 3 الأساسية ──────────────────────────────────────────

  /// القياسي — لمعظم انتقالات الواجهة.
  /// يقابل --ease-standard: cubic-bezier(.2,0,0,1) في التصميم.
  static const Curve standard = Curves.easeInOut;

  /// المعبّر — للانتقالات المهمة والمساحات الكبيرة (hero moments).
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;

  /// التباطؤ — للعناصر الداخلة للشاشة (تحليق للداخل): يبدأ سريعًا ويهدأ.
  /// يقابل --ease-decelerate: cubic-bezier(0,0,.2,1).
  static const Curve decelerate = Curves.decelerate;

  /// التسارع — للعناصر الخارجة من الشاشة: يبدأ بطيئًا وينطلق للخروج.
  /// يقابل --ease-accelerate: cubic-bezier(.3,0,1,.3).
  static const Curve accelerate = Curves.easeIn;

  // ── منحنيات مساعدة إضافية ─────────────────────────────────────────────────

  /// نابضي بارتداد — تفاعلات مرحة (FAB، بطاقات) — استخدمه باعتدال.
  static const Curve spring = Curves.elasticOut;

  /// خروج بارتداد خفيف — ممتاز للعناصر التي "تطفو" بالتكبير ثم تستقر.
  static const Curve easeOutBack = Curves.easeOutBack;

  /// خطي — **فقط** للحلقات المستمرة (مؤشرات تحميل، shimmer) حيث لا
  /// بداية ولا نهاية محسوسة. لا تستخدمه لانتقالات عادية — يبدو آليًا.
  static const Curve linear = Curves.linear;

  /// تكعيبي ناعم — انتقالات طبيعية الإحساس للمقاسات المتوسطة.
  static const Curve smooth = Curves.easeInOutCubic;

  // ── الأسماء الدلالية ──────────────────────────────────────────────────────

  /// دخول صفحة جديدة — تباطؤ (تصل سريعًا وتستقر بنعومة).
  static const Curve pageEnter = decelerate;

  /// خروج صفحة — تسارع (تنطلق من عندها للخارج).
  static const Curve pageExit = accelerate;

  /// ظهور النوافذ والحواريات — منحنى معبّر يمنحها حضورًا.
  static const Curve popupOpen = emphasized;

  /// إغلاق النوافذ والـ sheets — قياسي هادئ.
  static const Curve popupClose = standard;

  /// التفاعلات الدقيقة (ضغط زر، تبديل) — بارتداد خفيف يعطي إحساس "الحياة".
  static const Curve microInteraction = easeOutBack;
}
