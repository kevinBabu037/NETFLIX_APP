import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class CostumButton extends StatelessWidget {
  const CostumButton({
    super.key,
    required this.text, 
    required this.icon,
    this.iconSize=33,
    this.textSize=20,

  });
  final IconData icon;
  final String text;
 final double textSize;
 final double iconSize;
 
  @override
  Widget build(BuildContext context) {
    return  Column(
       children: [
        Icon(icon,color: kWhite,size: iconSize,),
        Text(text,style: TextStyle(fontSize:textSize,),)
       ],
     );
  }
}
