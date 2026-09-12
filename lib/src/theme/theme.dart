import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'text_theme.dart';
import 'color_schemes.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// القلب النابض لنظام الثيم — هنا تُبنى هوية عافيتك البصرية كاملة
/// ═══════════════════════════════════════════════════════════════════════════
///
/// هذا الملف يجيب على سؤال واحد كبير: "كيف يبدو كل شيء في التطبيق؟"
/// كل ويدجت Material (زر، حقل، بطاقة، شريط تنقل...) يقرأ مظهره من الثيم
/// الذي تنتجه الدوال هنا — لذلك تعديل سطر واحد هنا يغيّر التطبيق كله،
/// والعكس صحيح: **لا تكتب أبدًا ThemeData داخل شاشة أو ويدجت**.
///
/// خريطة الملف:
///   1. [_colorFromHex]      — أداة تحويل نص hex إلى Color
///   2. [AppDesignTokens]     — امتداد توكنز عام (مسافات/استدارات مختصرة)
///   3. [_buildTheme]         — باني ThemeData الموحد لكل الأوضاع
///   4. [buildLightTheme]     — الثيم الفاتح ← ألوان التصميم الحرفية
///   5. [buildDarkTheme]      — الثيم الداكن (مؤجل — راجع تعليقه)
///   6. [buildCupertinoTheme] — ثيم iOS الأصيل (غير موصول حاليًا)
///
/// ─── درس جوهري: من أين يأتي لون primary؟ ───
///
/// ColorScheme في Material 3 عبارة عن "خريطة أدوار": لكل دور معنى دلالي
/// ثابت تستخدمه كل ويدجتات Flutter دون أن تعرف قيمته. الأدوار التي
/// ستتعامل معها يوميًا في عافيتك:
///
///   primary              → بورجوندي العلامة #800020. الزر الأساسي "احجز
///                          موعدًا"، أيقونة الجرس، التاب النشط، الروابط.
///   onPrimary            → ما يُكتب **فوق** primary: نص الزر البورجوندي (أبيض).
///   primaryContainer     → النسخة الفاتحة جدًا #F7E9EC: خلفيات الشارات
///                          ("موعد قادم")، حاوية أيقونة التاب النشط في
///                          شريط التنقل، خلفية "اليوم المتاح" بشريط الأيام.
///   onPrimaryContainer   → ما يُكتب فوق primaryContainer: #5C0016 بورجوندي غامق.
///   surface              → الأبيض #FFFFFF: خلفية البطاقات والأسطح المرتفعة.
///   onSurface            → النص الأساسي فوق الأسطح: #1A1A1A (فحمي).
///   onSurfaceVariant     → النص الثانوي الباهت: #6E6E6E (أوصاف، captions).
///   surfaceDim           → خلفية الصفحة نفسها (canvas): #E5E5E5 — البطاقات
///                          البيضاء "تجلس" فوقه فتظهر بوضوح.
///   surfaceContainerLow  → #F7F7F7: أسطح أنعم من الحاوية (surface.soft).
///   surfaceContainer     → #EFEFEF: خلفيات الحاويات وشرائح segmented.
///   surfaceContainerHighest → #D9D9D9: أغمق درجات الأسطح (مسارات، عناصر).
///   outline              → الحدود الواضحة #B5B5B5 (border.strong).
///   outlineVariant       → الحدود الخفيفة والفواصل #E5E5E5 (border.default).
///   error / onError / errorContainer / onErrorContainer → عائلة الخطأ
///                          بأحادية التصميم: فحمي #1F1F1F — لا أحمر!
///
/// القاعدة الذهبية: البادئة "on" تعني دائمًا "لون المحتوى فوق الدور المذكور".
/// الوصول للويدجت: `context.colors.primary` (التعريف في context_extension.dart).

Color _colorFromHex(String hex) {
  final cleaned = hex.replaceFirst('#', '');
  return Color(int.parse('ff$cleaned', radix: 16));
}

/// ═══════════════════════════════════════════════════════════════════════════
/// امتداد توكنز عام يصلح كـ ThemeExtension (يتبع انتقال الثيم)
/// ═══════════════════════════════════════════════════════════════════════════
///
/// ملاحظة معمارية: المسافات والاستدارات اليومية تُستهلك من الثوابت المباشرة
/// (AppSpacing / AppBorders) لأنها لا تحتاج أن "تتحرك" مع الثيم. هذا
/// الامتداد للقيم التي قد يراد المستقبل جعلها تختلف بين الفاتح/الداكن
/// (كارتفاع ظل البطاقات). الويدجتات تعتمد النسخة الساكنة [fallback] فقط.
class AppDesignTokens extends ThemeExtension<AppDesignTokens> {
  const AppDesignTokens({
    required this.paddingSmall,
    required this.paddingMedium,
    required this.paddingLarge,
    required this.borderRadiusSmall,
    required this.borderRadiusMedium,
    required this.borderRadiusLarge,
    required this.cardElevation,
  });

  final double paddingSmall;
  final double paddingMedium;
  final double paddingLarge;
  final double borderRadiusSmall;
  final double borderRadiusMedium;
  final double borderRadiusLarge;
  final double cardElevation;

  /// النسخة الساكنة المستخدمة فعليًا — متطابقة مع AppSpacing/AppBorders.
  static const fallback = AppDesignTokens(
    paddingSmall: 8,
    paddingMedium: 16,
    paddingLarge: 24,
    borderRadiusSmall: 4,
    borderRadiusMedium: 12,
    borderRadiusLarge: 24,
    cardElevation: 0,
  );

  @override
  ThemeExtension<AppDesignTokens> copyWith({
    double? paddingSmall,
    double? paddingMedium,
    double? paddingLarge,
    double? borderRadiusSmall,
    double? borderRadiusMedium,
    double? borderRadiusLarge,
    double? cardElevation,
  }) {
    return AppDesignTokens(
      paddingSmall: paddingSmall ?? this.paddingSmall,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      paddingLarge: paddingLarge ?? this.paddingLarge,
      borderRadiusSmall: borderRadiusSmall ?? this.borderRadiusSmall,
      borderRadiusMedium: borderRadiusMedium ?? this.borderRadiusMedium,
      borderRadiusLarge: borderRadiusLarge ?? this.borderRadiusLarge,
      cardElevation: cardElevation ?? this.cardElevation,
    );
  }

  @override
  ThemeExtension<AppDesignTokens> lerp(
    covariant ThemeExtension<AppDesignTokens>? other,
    double t,
  ) {
    if (other is! AppDesignTokens) return this;
    return AppDesignTokens(
      paddingSmall: lerpDouble(paddingSmall, other.paddingSmall, t)!,
      paddingMedium: lerpDouble(paddingMedium, other.paddingMedium, t)!,
      paddingLarge: lerpDouble(paddingLarge, other.paddingLarge, t)!,
      borderRadiusSmall: lerpDouble(borderRadiusSmall, other.borderRadiusSmall, t)!,
      borderRadiusMedium: lerpDouble(borderRadiusMedium, other.borderRadiusMedium, t)!,
      borderRadiusLarge: lerpDouble(borderRadiusLarge, other.borderRadiusLarge, t)!,
      cardElevation: lerpDouble(cardElevation, other.cardElevation, t)!,
    );
  }

  static double? lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    a ??= 0.0;
    b ??= 0.0;
    return a + (b - a) * t;
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// باني الـ ThemeData الموحد — يُغذى بالألوان ويخرج ثيمًا كاملًا
/// ═══════════════════════════════════════════════════════════════════════════
///
/// هذه الدالة **محايدة لونيًا**: لا تحمل قيمة hex واحدة — كل الألوان تأتي
/// من [colorScheme] الممرر إليها. الفائدة: الوضعان الفاتح/الداكن يتشاركان
/// نفس "القواعد" (شكل الزر، حواشي الحقول، استدارات البطاقات...) وتختلفان
/// في الألوان فقط. كل قسم موثق بدوره:
ThemeData _buildTheme(ColorScheme colorScheme, AppColorsExtension customColors) {
  final textTheme = buildTextTheme();

  return ThemeData(
    // Material 3 — نظام تصميم Flutter الحالي (شكل الأزرار، الارتفاعات،
    // تدرجات الحالات). ويدجتاتنا مبنية على سلوكه — لا تعطّله.
    useMaterial3: true,
    primaryColor: colorScheme.primary,
    colorScheme: colorScheme,
    textTheme: textTheme,
    // الخط الافتراضي لكل التطبيق (أوزانه الأربعة مسجلة في pubspec.yaml).
    fontFamily: 'IBMPlexSansArabic',
    // امتداداتنا: الألوان الدلالية (نجاح/تحذير/معلومة/حجز) + التوكنز العامة.
    extensions: [
      customColors,
      AppDesignTokens.fallback,
    ],

    // ── الأساسيات ──────────────────────────────────────────────────────────

    // خلفية كل شاشة — canvas الفاتح #E5E5E5 (البطاقات البيضاء تبرز فوقه).
    scaffoldBackgroundColor: colorScheme.surfaceDim,
    dividerTheme: DividerThemeData(
      color: colorScheme.outlineVariant, // الفواصل: الخفيفة #E5E5E5
      thickness: 1,
      space: 1,
    ),
    // الأيقونات الافتراضية: فحمية بحجم 24 (حجم أيقونات التصميم).
    iconTheme: IconThemeData(
      color: colorScheme.onSurface,
      size: 24,
    ),

    // ── الأنماط الجاهزة للويدجتات ─────────────────────────────────────────
    // كل قسم أدناه = "الشكل الافتراضي" لويدجت Material. القيم مستمدة من
    // CSS المرجعي، وويدجتاتنا المشتركة (AppButton/AppTextField...) تعتمدها.

    // شريط العنوان: سطح أبيض بلا ظل، عنوان وسط بخط واضح.
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
    ),

    // الأزرار — استدارة 12 (radius-md) وارتفاع 48 (--touch-target).
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: const Size(88, 48),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ).copyWith(
        elevation: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) return 2;
          return 0;
        }),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(88, 48),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(88, 48),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: colorScheme.outline, width: 1.5),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(88, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // البطاقة — سطح بحد خفيف واستدارة 16 (radius-lg)، بلا ظل افتراضيًا
    // (الظل e1 يُضاف للبطاقات التفاعلية عبر ويدجت AppCard).
    cardTheme: CardThemeData(
      clipBehavior: Clip.antiAlias,
      elevation: AppDesignTokens.fallback.cardElevation,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colorScheme.outlineVariant, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      color: colorScheme.surfaceContainerLow,
    ),

    // حقول الإدخال — حدود خفيفة، والتركيز يضخّم حد البورجوندي لعرض 2
    // (يقابل --border-focus في التصميم).
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),

        borderSide: BorderSide(color: colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.error),
      ),
      floatingLabelStyle: TextStyle(color: colorScheme.primary),
      labelStyle: textTheme.labelMedium?.copyWith(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5)),
      hintStyle: textTheme.labelMedium?.copyWith(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5)),
    ),

    // شريط التنقل السفلي — سيُستبدل بويدجت مخصص من التصميم في مرحلة الويدجتات
    // (شريط التصميم: 3 تابات مع pill بورجوندي حول التاب النشط).
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.secondaryContainer,
      elevation: 8,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      height: 80,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return textTheme.labelSmall?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold);
        }
        return textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant);
      }),
    ),

    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.secondaryContainer,
      labelType: NavigationRailLabelType.all,
      unselectedLabelTextStyle: textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant),
      selectedLabelTextStyle: textTheme.labelSmall?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold),
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorColor: colorScheme.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: textTheme.titleSmall,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimaryContainer,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // الشارة chip — استدارة 8 وحد خفيف (تصميم الـ chip الكبسولي سيأتي
    // بويدجت مخصص أيضًا — chips في CSS استدارتها full).
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: BorderSide(color: colorScheme.outlineVariant),
      backgroundColor: colorScheme.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: textTheme.labelMedium,
    ),

    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      visualDensity: VisualDensity.comfortable,
      titleTextStyle: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      subtitleTextStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
    ),

    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return colorScheme.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return colorScheme.primaryContainer;
        return colorScheme.surfaceContainerHighest;
      }),
    ),

    // شريط الإشعار العائم (snackbar) — مستدير بلون معكوس داكن.
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onInverseSurface),
    ),

    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
      backgroundColor: colorScheme.surface,
      titleTextStyle: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      contentTextStyle: textTheme.bodyMedium,
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
    ),

    searchBarTheme: SearchBarThemeData(
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.all(colorScheme.surfaceContainerLow),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16)),
      hintStyle: WidgetStateProperty.all(textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant)),
    ),

    badgeTheme: BadgeThemeData(
      backgroundColor: colorScheme.error,
      textColor: colorScheme.onError,
      textStyle: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
    ),

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        selectedBackgroundColor: colorScheme.secondaryContainer,
        selectedForegroundColor: colorScheme.onSecondaryContainer,
        side: BorderSide(color: colorScheme.outline),
      ),
    ),

    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: textTheme.labelSmall?.copyWith(color: colorScheme.onInverseSurface),
    ),
  );
}

/// ═══════════════════════════════════════════════════════════════════════════
/// الثيم الفاتح — ثيم عافيتك الرسمي الحالي
/// ═══════════════════════════════════════════════════════════════════════════
///
/// الاستراتيجية (قرار معماري مهم):
///   1. نولّد ColorScheme من الـ seed — نأخذ بذلك تدرجات Material الجاهزة
///      لكل الأدوار الثانوية التي لم يحددها التصميم.
///   2. ثم copyWith **نجبر** الأدوار المحددة في tokens.css على قيمها
///      الحرفية — لأن fromSeed وحده لا يعطي لون التصميم نفسه (يختار
///      Material درجة tone 40 المشتقة، وليست #800020 حرفيًا).
///
/// هكذا نجمع الاثنين: دقة بكسلية مع التصميم + شبكة أمان Material
/// للأدوار التي لا يذكرها التصميم.
ThemeData buildLightTheme({required String primaryColorHex}) {
  final seed = _colorFromHex(primaryColorHex.isNotEmpty ? primaryColorHex : '#6750A4');
  final colorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.light,
  ).copyWith(
    primary: const Color(0xFF800020),          // بورجوندي العلامة (حرفي)
    onPrimary: const Color(0xFFFFFFFF),        // نص/أيقونة فوقه
    primaryContainer: const Color(0xFFF7E9EC), // خلفيات الشارات الفاتحة
    onPrimaryContainer: const Color(0xFF5C0016),
    surface: const Color(0xFFFFFFFF),          // البطاقات
    onSurface: const Color(0xFF1A1A1A),        // النص الأساسي
    onSurfaceVariant: const Color(0xFF6E6E6E), // النص الثانوي
    outline: const Color(0xFFB5B5B5),          // حدود واضحة (border.strong)
    outlineVariant: const Color(0xFFE5E5E5),   // حدود/فواصل خفيفة
    error: const Color(0xFF1F1F1F),            // خطأ فحمي — أحادية التصميم
    onError: const Color(0xFFFFFFFF),
    errorContainer: const Color(0xFFEFEFEF),
    onErrorContainer: const Color(0xFF1A1A1A),
    surfaceContainerLow: const Color(0xFFF7F7F7),     // surface-low
    surfaceContainer: const Color(0xFFEFEFEF),        // container
    surfaceContainerHighest: const Color(0xFFD9D9D9), // highest
    surfaceDim: const Color(0xFFE5E5E5),       // canvas — خلفية الصفحات
  );
  return _buildTheme(colorScheme, AppPalettes.light);
}

/// الثيم الداكن — ⚠️ مؤجل: التصميم المرجعي v2.1 فاتح فقط، والتطبيق مقفل
/// على `ThemeMode.light` في app.dart. هذه الدالة تبقى مشتقة من الـ seed
/// (ألوان غير معتمدة) حتى نصمم النسخة الداكنة رسميًا ونعيد قفل
/// `ThemeMode.system`. لا تعتمد على مظهرها حاليًا.
ThemeData buildDarkTheme({required String primaryColorHex}) {
  final seed = _colorFromHex(primaryColorHex.isNotEmpty ? primaryColorHex : '#6750A4');
  final colorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
  );
  return _buildTheme(colorScheme, AppPalettes.dark);
}

/// ثيم iOS الأصيل (Cupertino) — غير موصول بالتطبيق حاليًا (نستخدم
/// MaterialApp الموحد). أبقيناه من الـ scaffold لمستقبل يطلب تصميم iOS
/// مخصصًا؛ إن ظل غير مستخدم حتى نهاية المشروع يمكن حذفه بأمان.
CupertinoThemeData buildCupertinoTheme({required String primaryColorHex}) {
  final seed = _colorFromHex(primaryColorHex.isNotEmpty ? primaryColorHex : '#007AFF');

  return CupertinoThemeData(
    applyThemeToAll: true,
    primaryColor: seed,
    primaryContrastingColor: CupertinoColors.white,
    brightness: null, // Allow system-wide dark mode support
    scaffoldBackgroundColor: CupertinoColors.systemBackground,
    barBackgroundColor: CupertinoColors.systemGrey6,
    textTheme: CupertinoTextThemeData(
      primaryColor: seed,
      textStyle: const TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 17,
        letterSpacing: -0.41,
      ),
      actionTextStyle: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        color: seed,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      navTitleTextStyle: const TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w600,
        fontSize: 17,
        letterSpacing: -0.41,
      ),
      navLargeTitleTextStyle: const TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.bold,
        fontSize: 34,
        letterSpacing: 0.41,
      ),
      tabLabelTextStyle: const TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.24,
      ),
      pickerTextStyle: const TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 21,
        letterSpacing: -0.41,
      ),
      dateTimePickerTextStyle: const TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 21,
        letterSpacing: -0.41,
      ),
    ),
  );
}
