import 'dart:io';

import 'package:blog_app/constants.dart';
import 'package:uuid/uuid.dart';

class AddPostController {
  String id = Uuid().v1();

  addImageToStorage() async {
    try {} catch (e) {
      print(e);
    }
  }

  addPostToFirebase(
      String title, String content, String image, String category) async {
    try {
      await blogsRef.doc(id).set(
        {
          'blog_id': id,
          'title': title,
          'content': content,
          'user_id': firebaseAuth.currentUser!.uid,
          'image': image,
          'category': category,
          'timestamp': DateTime.now(),
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
