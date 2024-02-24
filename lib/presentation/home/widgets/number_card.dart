import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';

class Numbercard extends StatelessWidget {
  const Numbercard({super.key ,
  required this.index,
  required this.snapshot,
  });
   final int index;
   final AsyncSnapshot snapshot;
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
                image: DecorationImage(
                  image: NetworkImage("${Constants.imagePath}${snapshot.data[index].posterPath}"), 
                  fit: BoxFit.cover)
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