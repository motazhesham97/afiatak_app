import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// الظلال — من نظام التصميم المرجعي (Burgundy Monochrome v2.1)
/// ═══════════════════════════════════════════════════════════════════════════
///
/// التصميم يعرّف ثلاثة ظلال فقط — انضباط مقصود: الظل الخافت يمنح عمقًا
/// هادئًا دون إبهار، والقيم أحادية (فحمي شفاف) التزامًا بفلسفة "لا لون رابع".
///
/// قاعدة التحويل من CSS (`box-shadow: X Y blur rgba(r,g,b,a)`):
///   X,Y → offset: Offset(X, Y)
///   blur → blurRadius
///   rgba → Color(0xAARRGGBB): الشفافية (a×255) تُكتب بالـ hex **أولًا**
///   مثال: rgba(26,26,26,.055) → شفافية 14=0x0E واللون 1A1A1A → 0x0E1A1A1A
///
/// الاستخدام:
/// ```dart
/// Container(decoration: BoxDecoration(boxShadow: AppShadows.e1))
/// ```
abstract final class AppShadows {
  AppShadows._();

  /// بلا ظل — سطح مستوٍ (البطاقات غير الرفيعة، العناصر ذات الحد فقط).
  static const List<BoxShadow> none = [];

  /// e1 — الظل الرابط: البطاقات الساكنة، حقول الإدخال، أيقونات الأزرار
  /// الدائرية، صفوف القوائم التفاعلية.
  /// يقابل CSS: 0 2px 10px rgba(26,26,26,.055)
  static const List<BoxShadow> e1 = [
    BoxShadow(
      color: Color(0x0E1A1A1A),
      offset: Offset(0, 2),
      blurRadius: 10,
    ),
  ];

  /// e2 — الظل العائم: الأسطح المرفوعة فوق المحتوى (شريط الإجراء السفلي،
  /// النوافذ المنبثقة، العناصر المتراكمة).
  /// يقابل CSS: 0 14px 34px rgba(26,26,26,.11)
  static const List<BoxShadow> e2 = [
    BoxShadow(
      color: Color(0x1C1A1A1A),
      offset: Offset(0, 14),
      blurRadius: 34,
    ),
  ];

  /// brand — توهج بورجوندي تحت عناصر العلامة: الزر الأساسي، لوحة
  /// feature-panel في الرئيسية، نداء الطابور (queue-callout)، لوحة الدفع.
  /// ⚠️ هذا الظل الوحيد الملون في النظام كله — لأنه يخص العلامة نفسها.
  /// يقابل CSS: 0 12px 26px rgba(128,0,32,.20)
  static const List<BoxShadow> brand = [
    BoxShadow(
      color: Color(0x33800020),
      offset: Offset(0, 12),
      blurRadius: 26,
    ),
  ];
}
