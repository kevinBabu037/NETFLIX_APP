// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';

class MainCard extends StatelessWidget {
   MainCard({
    super.key,
    required this.index,
     this.snapshot
  });
    int index;
   final AsyncSnapshot? snapshot;  
   
  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 140  ,
      margin:const EdgeInsets.symmetric(horizontal: 10 ),
      decoration: BoxDecoration(
        borderRadius:kborderRadius,
        image: DecorationImage(
          image: NetworkImage("${Constants.imagePath}${snapshot!.data[index].posterPath}")
          ,fit: BoxFit.cover)
      ),
    );
  }
} 