import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const SearchTitle(title: 'Moies & TV'),
        Expanded(
          child: GridView.count( 
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1/1.5,     
            crossAxisCount: 3,
            children: List.generate(20, (index) =>const MainSearchCard() ),
            ),
        ) 
      ],
    ) ;
  }
}

class MainSearchCard extends StatelessWidget {
  const MainSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(right: 5 ,top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image:const DecorationImage( 
          image: NetworkImage(imageUrl,),fit: BoxFit.cover,
          )
      ),
    );
  }
}