import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../index.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(
    AppLifecycleState appLifecycleState,
  ) async {
    super.didChangeAppLifecycleState(appLifecycleState);

    if (appLifecycleState == AppLifecycleState.inactive) {}

    if (appLifecycleState == AppLifecycleState.resumed) {
      Future<void>.delayed(const Duration(milliseconds: 500), () {});
    }

    if (appLifecycleState == AppLifecycleState.paused) {}
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      // designSize: const Size(
      //   ScreenUtilConfig.screenWidth,
      //   ScreenUtilConfig.screenHeight,
      // ),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          locale: const Locale(Constants.defaultLocale),
          supportedLocales: const [
            Locale(Constants.vietnamese),
            Locale(Constants.english),
          ],
          navigatorKey: AliceUtils().getNavigatorKey,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          // binds: mainBindings,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          // translationsKeys: AppTranslation.translations,
          logWriterCallback: Logger1.write,
          fallbackLocale: const Locale(Constants.vietnamese),
          initialRoute: AppRouter.home,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
