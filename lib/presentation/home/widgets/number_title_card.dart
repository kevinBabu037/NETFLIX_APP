import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.snapShot
  });
  final AsyncSnapshot snapShot;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [  
       const MainTitle(title: 'Top Ten Tv Shows In India'), 
        LimitedBox( 
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index){
      return  Numbercard( index: index,snapshot: snapShot);
            })
          ),
        ) 
      ],
    );
  }
}