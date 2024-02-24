import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/models/movies.dart';

import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.movie
  });
   final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200, 
          child: Image.network(
             "${Constants.imagePath}${movie.posterPath}"
            ,fit: BoxFit.cover,), 
        ),
        Positioned(
          bottom: 7,
          right: 7 ,
          child: CircleAvatar(
          backgroundColor: kBlack.withOpacity(0.5),
          radius: 20,
           child:const Icon(Icons.volume_off,color: kWhite,size: 20 ,)),
        ),
      ],
    );
  }
}