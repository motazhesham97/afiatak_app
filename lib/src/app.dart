import 'package:afiatak_app/src/imports/core_imports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final current = _buildMaterialApp(context);
    Text('${context.colors.primary}');
    return current;
  }

  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      title: 'afiatak_app',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(primaryColorHex: '#800020'),
      darkTheme: buildDarkTheme(primaryColorHex: '#800020'),
      // راح نخليه على مود ال light مؤقتا
      themeMode: ThemeMode.light,
      routerConfig: appRouter,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        Widget current = child!;
        current = SkeletonWrapper(child: current);
        current = SessionListenerWrapper(child: current);
        return current;
      },
    );
  }
}