import 'package:decksly/common/application.constants.dart';
import 'package:decksly/common/colors.dart';
import 'package:decksly/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeckslyApp extends StatelessWidget {
//  const DeckslyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
   //     BlocProvider(
  //        create: (_) => getIt<FavouritesBloc>(),
  //      ),
      ],
      child: MaterialApp(
        title: APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          splashColor: AppColors.splashColor,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //      initialRoute: rHomePage,
  //      onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}