import 'package:blog_app/app_theme.dart';
import 'package:blog_app/home/controller/add_post_controller.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  ScrollController _scrollController = ScrollController();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final addPost = AddPostController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'New Post',
          style: AppTheme.appBarTitleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: titleController,
                      maxLines: 2,
                      decoration: AppTheme.textFieldDecoration.copyWith(
                        labelText: 'Post Title',
                        prefixIcon: Icon(Icons.title),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: contentController,
                      maxLines: 10,
                      decoration: AppTheme.textFieldDecoration.copyWith(
                        labelText: 'Content',
                        prefixIcon: Icon(Icons.content_copy),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addPost.addPostToFirebase(
                        titleController.text,
                        contentController.text,
                        '',
                        'Movies',
                      );
                      titleController.clear();
                      contentController.clear();
                    },
                    child: Text(
                      'Add Post',
                      style: AppTheme.buttonText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
