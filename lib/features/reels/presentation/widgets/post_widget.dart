import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_project/features/reels/data/entities/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height/13,
          color: Colors.white,
          child: Center(
            child: ListTile(
              leading: ClipOval(
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset(post.imagePath, fit: BoxFit.cover),
                ),
              ),
              title: Text(
                post.name,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              subtitle: Text(
                post.subtitle,
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
              trailing: const Icon(Icons.more_horiz),
            ),
          ),
        ),
        Container(
          width: size.width,
          height:size.height/3,
          child: post.isVideo
              ? Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    size: 40,
                    color: Colors.white.withOpacity(0.7),
                  ),
                )
              : Image.asset(post.postContent, fit: BoxFit.cover),
          decoration: BoxDecoration(
            image: post.isVideo
                ? null
                : DecorationImage(
                    image: AssetImage(post.postContent),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Container(
          width: size.width,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite_outlined,
                    size: 25,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Image.asset(
                    "assets/images/send.png",
                    height: 28,
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/commenter.png",
                    height: 28,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 19, top: 13.5),
                child: Text(
                  '0 likes',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Je vis en Jesus je Prospère!',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
