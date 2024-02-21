import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';

class AppBarwidget extends StatelessWidget {
  const AppBarwidget({super.key,required this.title});
  final String title; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(title,style:const TextStyle(fontSize: 30,fontWeight: FontWeight.w900),), 
       const Spacer(),
        const Icon(Icons.cast,color: Colors.white,size: 30 ,),
        kWidth, 
        Container(
         height: 30,
         width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image:const DecorationImage(image: NetworkImage('https://i.pinimg.com/200x/c4/88/34/c488340ad56e5454f4576f6c708b63aa.jpg'))
        ),
        ),
        kWidth
      ],
    );
  }
}