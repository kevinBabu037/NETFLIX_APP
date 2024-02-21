import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
import '../../home/widgets/costum_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComimgSoonWidget extends StatelessWidget {
  const ComimgSoonWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;

    return Row(
      children: [
       const SizedBox(
        height:450 ,
        width: 50,
        child:Column(
          children: [
            Text('FEB',style: TextStyle(fontSize: 14,color: Colors.grey),), 
            Text('11',style: TextStyle(letterSpacing: 4, fontSize: 30,fontWeight: FontWeight.w900),),  
          ],
        ) ,
        ), 
        SizedBox(
         height: 450 ,
         width: size.width-50,      
         child:const Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            VideoWidget(),
            kHeight,   
            Row(
              children: [
                Text('Tall girl 2',style: TextStyle(fontSize: 35,letterSpacing: -1 ),),
                Spacer(), 
                CostumButton(text: 'Remind Me', icon: Icons.notifications,iconSize:20,textSize: 13,),
                kWidth,
                kWidth,
                 CostumButton(text: 'Info', icon: Icons.info,iconSize: 20,textSize: 13  ,),
                 kWidth,
                 kWidth
              ],
            ),
            kHeight,
            Text('Coming On Firiday'),
           kHeight,
            Text('Tall Girl 2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5),),
           kHeight,
           Text('Landing the lead in the school musical is a\n dream come true for jodi, until the pressure sends her confidence -- and her relationship -- into a tailspon.',style: TextStyle(color: Colors.grey),) ,
           
          ],
         ),
        )
      ],
      
    );
  }
}

