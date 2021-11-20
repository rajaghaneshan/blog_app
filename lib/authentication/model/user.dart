import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      id: doc['user_id'],
      name: doc['name'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
    );
  }
}
