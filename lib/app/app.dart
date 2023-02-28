import 'package:decksly/common/application.constants.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/navigation/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckslyApp extends StatelessWidget {
  DeckslyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(787, 375),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            title: APP_NAME,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: FontStyles.FONT_FAMILY,
              primaryColor: AppColors.vanDykeBrown,
              splashColor: AppColors.bistreBrown,
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.gold),
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: AppColors.gold,
              ),
            ),
          );
        });
  }
}
