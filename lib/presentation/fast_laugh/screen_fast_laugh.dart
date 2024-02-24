import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fast_laugh/widgets/video_list_items.dart';

import '../../core/constant.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: kVideos.length,
          itemBuilder: (BuildContext context, int index) {
            return VideoListItems(videoUrl: kVideos[index],);
          },
        ), 
      ),
    );
  }
}

