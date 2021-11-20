import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  final String blogId;
  final String title;
  final String content;
  final String category;
  final Timestamp timestamp;
  final String image;
  final String userId;

  BlogModel({
    required this.blogId,
    required this.title,
    required this.content,
    required this.category,
    required this.timestamp,
    required this.image,
    required this.userId,
  });

  factory BlogModel.fromDocument(DocumentSnapshot doc) {
    return BlogModel(
      blogId: doc['blog_id'],
      title: doc['title'],
      content: doc['content'],
      category: doc['category'],
      timestamp: doc['timestamp'],
      image: doc['image'],
      userId: doc['user_id'],
    );
  }
}
