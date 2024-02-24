import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/models/movies.dart';
import '../../home/widgets/costum_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComimgSoonWidget extends StatelessWidget {
  const ComimgSoonWidget({
    super.key,
    required this.movie, 
  });

   final Movie movie;
    



  @override
  Widget build(BuildContext context) {
          DateTime releaseDate = DateTime.parse(movie.releaseDate);
           String day = releaseDate.day.toString();

           
    return Row(
      children: [
        SizedBox(
        height:450 ,
        width: 50,
        child:Column(
          children: [
           const Text("FEB",style: TextStyle(fontSize: 14,color: Colors.grey),), 
            Text(day,style:const TextStyle(letterSpacing: 4, fontSize: 30,fontWeight: FontWeight.w900),),  
          ],
        ) ,
        ), 
        Flexible(
        //  height: 450 ,
        //  width: size.width-50,      
         child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             VideoWidget(movie: movie,),
            kHeight,   
            Row(
              children: [
               Expanded(child: Text(movie.title,style:const TextStyle(fontSize: 30,letterSpacing: -1 ,),)), 
              
               const CostumButton(text: 'Remind Me', icon: Icons.notifications,iconSize:20,textSize: 13,),
                kWidth,
                kWidth,
                const  CostumButton(text: 'Info', icon: Icons.info,iconSize: 20,textSize: 13  ,),
                 kWidth,
                 kWidth
              ],
            ),
            kHeight,
             Text(" Comming On: ${movie.releaseDate}"),
           kHeight,
             Text(movie.orginalTitle,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5),),
           kHeight,
            Text(movie.overview,style:const TextStyle(color: Colors.grey),) ,
           
          ],
         ),
        )
      ],
      
    );
  }
  
}

