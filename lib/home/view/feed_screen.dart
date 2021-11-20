import 'package:blog_app/blog/model/blog_model.dart';
import 'package:blog_app/constants.dart';
import 'package:blog_app/home/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';
import 'blog_post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home',
          style: AppTheme.appBarTitleText,
        ),
      ),
      body: Consumer<HomeController>(
        builder: (context, data, _) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: size.width * 0.05,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => data.changeTab(0),
                        child: Text(
                          'All Feed',
                          style: data.tabIndex == 0
                              ? AppTheme.activeTabText
                              : AppTheme.inactiveTabText,
                        ),
                      ),
                      InkWell(
                        onTap: () => data.changeTab(1),
                        child: Text(
                          'Movies',
                          style: data.tabIndex == 1
                              ? AppTheme.activeTabText
                              : AppTheme.inactiveTabText,
                        ),
                      ),
                      InkWell(
                        onTap: () => data.changeTab(2),
                        child: Text(
                          'Sports',
                          style: data.tabIndex == 2
                              ? AppTheme.activeTabText
                              : AppTheme.inactiveTabText,
                        ),
                      ),
                    ],
                  ),
                ),
                data.tabIndex == 0
                    ? FutureBuilder<QuerySnapshot>(
                        future: blogsRef
                            .orderBy('timestamp', descending: true)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.docs.isEmpty) {
                              return Text('No data');
                            }
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              controller: scrollController,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                BlogModel data = BlogModel.fromDocument(
                                    snapshot.data!.docs[index]);
                                return BlogPostCard(data: data);
                              },
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        })
                    : data.tabIndex == 1
                        ? FutureBuilder<QuerySnapshot>(
                            future: blogsRef
                                .where('category', isEqualTo: 'movies')
                                .orderBy('timestamp', descending: true)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.docs.isEmpty) {
                                  return Text('No data');
                                }
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    BlogModel data = BlogModel.fromDocument(
                                        snapshot.data!.docs[index]);
                                    return BlogPostCard(data: data);
                                  },
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            })
                        : FutureBuilder<QuerySnapshot>(
                            future: blogsRef
                                .where('category', isEqualTo: 'sports')
                                .orderBy('timestamp', descending: true)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.docs.isEmpty) {
                                  return Text('No data');
                                }
                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    BlogModel data = BlogModel.fromDocument(
                                        snapshot.data!.docs[index]);
                                    
                                    return BlogPostCard(data: data);
                                  },
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
