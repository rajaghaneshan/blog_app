import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

const Color kPrimaryColor = Colors.pink;
final googleSignIn = GoogleSignIn();
final usersRef = FirebaseFirestore.instance.collection('users');
final blogsRef = FirebaseFirestore.instance.collection('blogs');
final firebaseAuth = FirebaseAuth.instance;
