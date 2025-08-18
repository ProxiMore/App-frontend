import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proximore/router/router.dart';
import 'package:proximore/utils/constants.dart';

import 'injection/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Désactivation du mode "paysage" :
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Get It :
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ProxiMore App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: 'Satoshi',
        textTheme: GoogleFonts.staatlichesTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Constants.lightest,
      ),
      routerConfig: router,
    );
  }
}
