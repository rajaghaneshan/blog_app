import 'package:blog_app/app_theme.dart';
import 'package:blog_app/blog/model/blog_model.dart';
import 'package:blog_app/blog/view/blog_screen.dart';
import 'package:blog_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlogPostCard extends StatelessWidget {
  final BlogModel data;
  const BlogPostCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime time = data.timestamp.toDate();
    var formatter = DateFormat.yMMMMd();
    var formattedTime = formatter.format(time).toString();
    print(formattedTime);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogScreen(blogId: data.blogId),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 3),
              blurRadius: 8,
              color: Colors.black26,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // borderRadius: BorderRadius.circular(10.0),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    data.image != "" ? data.image : placeholderImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Text(
                '${data.title}',
                style: AppTheme.cardTitleText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text(formattedTime.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
