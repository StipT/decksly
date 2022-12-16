import 'package:decksly/app/di.dart';
import 'package:decksly/common/application.constants.dart';
import 'package:decksly/common/colors.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/navigation/navigation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: MaterialApp.router(
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        title: APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          splashColor: AppColors.splashColor,
        ),
      ),
    );
  }
}
