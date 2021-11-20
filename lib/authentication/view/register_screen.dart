import 'package:blog_app/authentication/controller/auth_controller.dart';
import 'package:blog_app/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: Container(
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
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.pink),
                        prefixIcon: Icon(Icons.account_circle_outlined,
                            color: Colors.pink),
                      ),
                      cursorColor: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.pink),
                        prefixIcon:
                            Icon(Icons.email_outlined, color: Colors.pink),
                      ),
                      cursorColor: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.pink),
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Colors.pink),
                      ),
                      cursorColor: Colors.pink,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await AuthController().signUpWithEmail(
                          emailController.text,
                          passwordController.text,
                          nameController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
