import 'package:decksly/app/di.dart';
import 'package:decksly/common/application.constants.dart';
import 'package:decksly/common/colors.dart';
import 'package:decksly/common/fonts.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/navigation/navigation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckslyApp extends StatelessWidget {
  const DeckslyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CardGalleryBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 787),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            routerDelegate: appRouter.routerDelegate,
            routeInformationParser: appRouter.routeInformationParser,
            title: APP_NAME,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: FontStyles.FONT_FAMILY,
              primaryColor: AppColors.primary,
              splashColor: AppColors.splashColor,
            ),
          );
        },
      ),
    );
  }
}
