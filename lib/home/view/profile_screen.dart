import 'package:blog_app/authentication/controller/auth_controller.dart';
import 'package:blog_app/authentication/view/auth_screen.dart';
import 'package:blog_app/constants.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: AppTheme.appBarTitleText,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: kPrimaryColor,
                  // backgroundImage: NetworkImage(
                  //     '${homeController.currentUser.value!.photoUrl}'),
                ),
              ),
              Expanded(
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${firebaseAuth.currentUser!.displayName}'),
                      Text('${firebaseAuth.currentUser!.email}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: TextButton(
              onPressed: () {
                firebaseAuth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  Text(
                    ' Log out',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
