import 'package:blog_app/app_theme.dart';
import 'package:blog_app/authentication/controller/auth_controller.dart';
import 'package:blog_app/authentication/view/register_screen.dart';
import 'package:blog_app/constants.dart';
import 'package:blog_app/home/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final authControler = AuthController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // User? user = firebaseAuth.currentUser;
    // if (user != null) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomeScreen(),
    //     ),
    //   );
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: GradientColors.wildApple,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.2, bottom: 20),
                child: Text(
                  'Blog App',
                  style: AppTheme.logoText,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: AppTheme.textFieldDecoration.copyWith(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined)),
                        cursorColor: Colors.pink,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: AppTheme.textFieldDecoration.copyWith(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        cursorColor: Colors.pink,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        bool isVaild = await authControler.signInWithEmail(
                          emailController.text,
                          passwordController.text,
                        );
                        if (isVaild) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Error Signing In'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Sign in',
                        style: AppTheme.buttonText,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'or',
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  primary: Color(0xFF0470A6),
                ),
                onPressed: () {
                  authControler.signInWithGoogle().then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.google,
                  size: 40,
                ),
                label: Text(
                  'Sign in with Google',
                  style: AppTheme.buttonText,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                child: Text(
                  'New User? Sign up',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
