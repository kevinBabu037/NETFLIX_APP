import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';

class Numbercard extends StatelessWidget {
  const Numbercard({super.key ,required this.index});
   final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
           const SizedBox( 
              width: 40 ,
            ),
    
            Container(
              height: 250,
              width: 140  ,
              margin:const EdgeInsets.only(right: 10 ),
              decoration: BoxDecoration(
                borderRadius:kborderRadius,
                image:const DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover)
              ),
            ),
             
          ],
        ),
          Positioned( 
            bottom: 0,
            left: 20,
            child: BorderedText(
              strokeColor: Colors.white ,
               strokeWidth: 5,
              child: Text("${index+1}",
               style:const TextStyle(color: Colors.black,
                fontSize: 120,
                fontWeight: FontWeight.bold

                ))
           ,)),
      ],
    );
  }
}