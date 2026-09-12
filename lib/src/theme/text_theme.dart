import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// مقياس الطباعة الكامل — مترجم من توكنات التصميم المرجعي (--type-*)
/// ═══════════════════════════════════════════════════════════════════════════
///
/// الفكرة: تصميمنا يعرّف 10 مواصفات نصية (display، h1، h2، h3، body-lg،
/// body، label-lg، label، body-sm، caption)، بينما يفرض Flutter 15 "دورًا"
/// إلزاميًا. الحل: كل دور Material يأخذ مواصفة أقرب دور في تصميمنا —
/// فتبقى كل واجهات Flutter القياسية (AppBar، ListTile، الأزرار...) متناسقة
/// تلقائيًا مع هويتنا دون أي جهد إضافي في الشاشات.
///
/// ─── كيف تقرأ كل مواصفة؟ ───
///   fontSize = حجم النص بالبكسل (من --type-*-size)
///   fontWeight = الوزن (من --type-*-weight — يعمل لأن أوزان الخط الأربعة
///                مسجلة في pubspec.yaml)
///   height = كثافة السطر كنسبة (line-height ÷ font-size من التصميم)
///   ⚠️ لا letterSpacing إطلاقًا — القيم الافتراضية مصممة للإنجليزية وتفسد
///   اتصال الحروف العربية.
///
/// ─── القاعدة التشغيلية في الشاشات ───
/// لا تكتب أبدًا TextStyle(fontSize: 20, ...) داخل ويدجت — اختر الدور:
/// ```dart
/// Text('ابدأ رحلتك الصحية', style: context.textTheme.displayLarge)
/// ```
/// (الوصول المختصر `context.textTheme` معرّف في context_extension.dart).
TextTheme buildTextTheme() {
  const baseTextTheme = TextTheme(
    // ── عائلة Display — الأكبر والأبرز: عناوين البطولية فقط ────────────────

    /// Display — 32/40, w700 (--type-display).
    /// الاستخدام: عنوان الرئيسية البطولي "ابدأ رحلتك الصحية"، المبالغ
    /// الكبيرة جداً (amount.big 32/40).
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),

    /// مطابق لـ H1 — 28/36, w700.
    /// التصميم لا يستخدم مستويين Display — مملوء بقيمة H1 حتى لا ينتج أي
    /// استخدام غير مقصود نصًا خارج مقياسنا (قاعدة: كل دور له قيمة من
    /// مقياسنا حتى لو لم يُستخدم).
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.29,
    ),

    /// مطابق لـ H2 — 24/32, w700.
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.33,
    ),

    // ── عائلة Headline — عناوين الصفحات والأقسام الكبيرة ────────────────────

    /// H1 — 28/36, w700 (--type-h1).
    /// الاستخدام: عناوين المستوى الأول (نادرة في تطبيق موبايل مركّز).
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.29,
    ),

    /// H2 — 24/32, w700 (--type-h2).
    /// الاستخدام: اسم المنشأة، عنوان feature-panel، رقم الحجز الكبير،
    /// المبلغ الرئيسي في amount-block.
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.33,
    ),

    /// H3 — 20/28, w600 (--type-h3).
    /// الاستخدام: عناوين أقسام الصفحة (section-heading .label)، عنوان
    /// حالة الفراغ (empty-state .title)، اسم الطبيب في بطاقة الهوية.
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),

    // ── عائلة Title — عناوين المكونات داخل البطاقات والقوائم ────────────────

    /// مطابق لـ H3 — 20/28, w600 (عنوان مكون بارز).
    /// الاستخدام: عناوين الحواريات ورؤوس الـ sheets الكبيرة.
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),

    /// Label Large — 16/24, w600 (--type-label-lg).
    /// الاستخدام: عناوين البطاقات القياسية، عنوان صف القائمة، عنوان حقل
    /// النموذج، نص الـ tab.
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),

    /// Label — 14/22, w600 (--type-label).
    /// الاستخدام: العناوين المصغرة الكثيفة (قيم info-row)، تسميات مضغوطة.
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.57,
    ),

    // ── عائلة Body — نصوص القراءة والمحتوى ──────────────────────────────────

    /// Body Large — 18/30, w400 (--type-body-lg).
    /// الاستخدام: النص المميز الكبير (رقم الهاتف المعروض في شاشة OTP).
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.67,
    ),

    /// Body — 16/27, w400 (--type-body). النمط "الحصان العامل".
    /// الاستخدام: نصوص الفقرات (bio، وصف home-hero)، النص المكتوب داخل
    /// حقول الإدخال، نص الرسائل.
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.69,
    ),

    /// Body Small — 14/23, w400 (--type-body-sm).
    /// الاستخدام: الأوصاف الثانوية (subtitle صف القائمة، نص status-copy،
    /// نص الشرح تحت العناوين، helper text للحقول).
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.64,
    ),

    // ── عائلة Label — تسميات عناصر التحكم (ليست لنصوص القراءة) ──────────────

    /// Label Large — 16/24, w600 (--type-label-lg).
    /// ⚠️ الوزن 600 وليس 500 افتراضي Material — لأن هذا الدور هو الذي
    /// تقرؤه الأزرار تلقائياً، والتصميم يحدد نص الأزرار بـ 600.
    /// الاستخدام: نص كل الأزرار (button font: label-lg)، عناوين صفوف
    /// القوائم البارزة.
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),

    /// Label — 14/22, w600 (--type-label).
    /// الاستخدام: نص الـ chips والـ badges، نص eyebrow ("الرعاية أقرب مما
    /// تتوقع")، عدّاد الأحرف في الحقول.
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.57,
    ),

    /// Caption — 12/20, w500 (--type-caption).
    /// الاستخدام: الطوابع الزمنية للإشعارات، النصوص الدقيقة (meta)،
    /// تسميات شريط التنقل السفلي (12px في CSS).
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.67,
    ),
  );

  // ربط عائلة الخط الأساسية بكل الأدوار دفعة واحدة — الأوزان تُلتقط
  // تلقائيًا من ملفات الخط المسجلة في pubspec.yaml.
  return baseTextTheme.apply(fontFamily: 'IBMPlexSansArabic');
}
