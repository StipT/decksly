import 'package:decksly/app/di.dart';
import 'package:decksly/common/application.constants.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/deck_selector/ui/bloc/deck_creator_bloc.dart';
import 'package:decksly/navigation/navigation_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckslyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CardGalleryBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<DeckCreatorBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(787, 375),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerDelegate: appRouter.routerDelegate,
            routeInformationParser: appRouter.routeInformationParser,
            title: APP_NAME,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: FontStyles.FONT_FAMILY,
              primaryColor: AppColors.vanDykeBrown,
              splashColor: AppColors.bistreBrown,
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.gold),
            ),
          );
        },
      ),
    );
  }

  const DeckslyApp({super.key});
}
