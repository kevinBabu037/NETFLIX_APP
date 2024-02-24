import 'package:flutter/material.dart';
import 'package:netflix_app/models/movies.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';
import '../../../core/constant.dart';
import '../../home/widgets/costum_button_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  const EveryOneWatchingWidget({
    super.key,
    required this.movie
  });
   final Movie movie;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const  EdgeInsets.only(left: 6,right: 6),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
         [
               kHeight,
                Text(movie.title,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5),),
               kHeight,
               Text(movie.overview,style:const TextStyle(color: Colors.grey),),
               kHeight50, 
               VideoWidget(movie: movie,) ,
               kHeight,
               const Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [  
                    CostumButton(text: 'Share', icon: Icons.share,iconSize: 30,textSize: 13  ,),
                    kWidth,
                    CostumButton(text: 'My List', icon: Icons.add,iconSize: 30,textSize: 13  ,),
                     kWidth,
                    CostumButton(text: 'Play', icon: Icons.play_arrow,iconSize: 30,textSize: 13  ,),  
                     kWidth, 
                  ],
                )
              ],
        
      ),
    );
  }
}