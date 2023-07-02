
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsiv1/pages/pages.dart';
import 'package:skripsiv1/utils/utils.dart';

Future <void> main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<TentangProvider>(
            create: (context) => TentangProvider()),
        ChangeNotifierProvider<FaqProvider>(
            create: (context) => FaqProvider()),
        ChangeNotifierProvider<CUser>(
            create: (context) => CUser()),
      ],
      builder: (context, child) {
        Session.getUser().then((user) {
          if (user != null) context.read<CUser>().data = user;
        });
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoute.routerConfig,
        );
      },
    );
  }
  }

