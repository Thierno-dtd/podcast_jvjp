import 'package:flutter/material.dart';
import 'package:podcast_project/core/widgets/appbar.dart';
import 'package:podcast_project/features/reels/data/entities/post.dart';
import 'package:podcast_project/features/reels/presentation/widgets/post_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaMage extends StatefulWidget {
  const SocialMediaMage({super.key});

  @override
  State<SocialMediaMage> createState() => _SocialMediaMageState();
}

class _SocialMediaMageState extends State<SocialMediaMage> {
  
   final List<Map<String, dynamic>> postsData = [
    {
      "imagePath": "assets/images/2.jpg",
      "name": "Pasteur 1",
      "subtitle": "Rev",
      "postContent": "assets/images/2.jpg",
      "isVideo": false,
    },
    {
      "imagePath": "assets/images/3.jpg",
      "name": "Pasteur 2",
      "subtitle": "Minister",
      "postContent": "assets/videos/simple_video.mp4",
      "isVideo": true,
    },
    // Plus de posts
  ];

  late final List<Post> posts;

   @override
  void initState() {
    super.initState();
    posts = postsData.map((data) => Post.fromMap(data)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("REELS"),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                 return PostWidget(post: posts[index]);
              },
              childCount: posts.length,// Longueur de la liste
            ),
          ),
        ],
      ),
    );
  }
}
