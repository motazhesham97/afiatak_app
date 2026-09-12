/// ═══════════════════════════════════════════════════════════════════════════
/// ملف التصدير الموحد لكل أسس نظام التصميم (Design Tokens)
/// ═══════════════════════════════════════════════════════════════════════════
///
/// هذا "برميل" (barrel): ملف لا يحوي منطقًا، وظيفته الوحيدة تصدير كل ملفات
/// الأساس من مكان واحد — فتكفي سطر استيراد واحد في أي ويدجت:
///
/// ```dart
/// import 'package:afiatak_app/src/theme/theme_constants.dart';
///
/// SizedBox(height: AppSpacing.md)                                  // مسافات
/// BoxDecoration(borderRadius: AppBorders.card)                     // استدارات
/// BoxDecoration(boxShadow: AppShadows.e1)                          // ظلال
/// AnimatedContainer(duration: AppDurations.normal,                 // مدد
///   curve: AppCurves.standard)                                     // منحنيات
/// context.appColors.success                                        // ألوان دلالية
/// context.textTheme.titleMedium                                    // أنماط نصية
/// ```
///
/// قواعد:
/// - أبقِ نمط التصدير موحدًا: أضف كل ملف توكنز جديد هنا.
/// - الألوان القياسية (primary/surface/...) تُستهلك عبر `context.colors`
///   ولا تحتاج هذا الاستيراد — فهي جزء من ColorScheme القياسي.
library;

export 'app_spacing.dart';
export 'app_borders.dart';
export 'app_shadows.dart';
export 'app_durations.dart';
export 'app_curves.dart';
export 'color_schemes.dart';
export 'text_theme.dart';
export 'theme.dart';
