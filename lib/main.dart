import 'package:blog_app/authentication/view/auth_screen.dart';
import 'package:blog_app/constants.dart';
import 'package:blog_app/home/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/view/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user = firebaseAuth.currentUser;

    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: user != null ? const HomeScreen() : const AuthScreen(),
      ),
    );
  }
}
