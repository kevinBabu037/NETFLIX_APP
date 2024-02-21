import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';

class VideoListItems extends StatelessWidget {
  const VideoListItems({super.key,required this.index});
   final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
        Align(alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              //left side//
              Padding(
                padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: kBlack.withOpacity(0.5),
                  radius: 26,
                  child:const Icon(Icons.volume_off,color: kWhite,size: 27,)),
              ),
                 
                 ///right side///
                
                const Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8 ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                    VdieoAcrionsWidget(icon: Icons.emoji_emotions, text: " LOL"),
                    VdieoAcrionsWidget(icon: Icons.add, text: "My List"),
                    VdieoAcrionsWidget(icon: Icons.share, text: "Share"),
                    VdieoAcrionsWidget(icon: Icons.play_arrow, text: "Play"),
                  ],
                 )

            ],
          ),
        ) 
      ],
    ) ;
  }
}

class VdieoAcrionsWidget extends StatelessWidget {
  const VdieoAcrionsWidget({super.key ,required this.icon, required this.text});
   final IconData icon;
   final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 8 ),
      child: Column(
        children: [
          Icon(icon,color: kWhite,size: 27,),
          Text(text,style: const TextStyle(fontSize: 16),),
        ],
      ),
    ) ;
  }
}