import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/home/widgets/costum_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
             children: [
               Container(
                height: 600,
                 decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(kMainPageImg)
                    )
                 ),
               ),

               Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 12 ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [  
                    const CostumButton(icon: Icons.add,text:'My List'),
                       _playButton(),
                    const CostumButton(icon: Icons.info,text:'Info'),
                    ],
                   ),
                 ),
               )
             ],
           );
  }
   TextButton _playButton() {
    return TextButton.icon(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(kWhite)
                      ) ,
                       label:const Padding(
                         padding:  EdgeInsets.symmetric(horizontal: 10),
                         child:  Text('Play',style: TextStyle(fontSize: 20,color: kBlack),),
                       ),
                      onPressed: (){}, 
                      icon:const Icon(
                       Icons.play_arrow,
                       color: kBlack,
                      size:25 ,
                      ));
  }
}