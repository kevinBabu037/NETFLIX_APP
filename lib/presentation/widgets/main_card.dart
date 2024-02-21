import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 140  ,
      margin:const EdgeInsets.symmetric(horizontal: 10 ),
      decoration: BoxDecoration(
        borderRadius:kborderRadius,
        image:const DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover)
      ),
    );
  }
} 