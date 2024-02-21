import 'package:flutter/material.dart';
import '../../../core/constant.dart';
import '../../home/widgets/costum_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  const EveryOneWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(left: 6,right: 6),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
         [
               kHeight,
                Text('Tall Girl 2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5),),
               kHeight,
               Text('Landing the lead in the school musical is a\n dream come true for jodi, until the pressure sends her confidence -- and her relationship -- into a tailspon.',style: TextStyle(color: Colors.grey),),
               kHeight50, 
               VideoWidget() ,
               kHeight,
                Row(mainAxisAlignment: MainAxisAlignment.end,
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