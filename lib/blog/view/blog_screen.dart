import 'package:blog_app/app_theme.dart';
import 'package:blog_app/authentication/model/user.dart';
import 'package:blog_app/blog/model/blog_model.dart';
import 'package:blog_app/blog/view/back_button.dart';
import 'package:blog_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  final String blogId;
  const BlogScreen({Key? key, required this.blogId}) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            FutureBuilder<DocumentSnapshot>(
                future: blogsRef.doc(widget.blogId).get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  BlogModel data = BlogModel.fromDocument(snapshot.data!);
                  print(data.blogId);
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                image: NetworkImage(
                                  data.image == ''
                                      ? placeholderImage
                                      : data.image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              data.title,
                              style: AppTheme.blogTitle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FutureBuilder<DocumentSnapshot>(
                                  future: usersRef.doc(data.userId).get(),
                                  builder: (context, userSnapshot) {
                                    if (!userSnapshot.hasData) {
                                      return CircularProgressIndicator();
                                    }
                                    UserModel userData = UserModel.fromDocument(
                                        userSnapshot.data!);
                                    return Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: CircleAvatar(
                                            backgroundColor: kPrimaryColor,
                                            backgroundImage: NetworkImage(
                                              (userData.photoUrl == '' ||
                                                      userData.photoUrl == null)
                                                  ? placeholderImage
                                                  : userData.photoUrl,
                                            ),
                                            radius: 20,
                                          ),
                                        ),
                                        Text(
                                          userData.name,
                                          style: AppTheme.blogContent,
                                        ),
                                      ],
                                    );
                                  }),
                              Text(
                                data.timestamp.toDate().toString(),
                                style: AppTheme.blogContent,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              data.content,
                              style: AppTheme.blogContent.copyWith(height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
