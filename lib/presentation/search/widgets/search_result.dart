import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';


class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key,required this.snapshot});
  final AsyncSnapshot snapshot;
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
            children: List.generate(snapshot.data.length, (index) => MainSearchCard(index:index ,snapshot: snapshot,) ),
            ),
        ) 
      ],
    ) ;
  }
}

class MainSearchCard extends StatelessWidget {
  const MainSearchCard({super.key,required this.index,required this.snapshot});
   final int index;
   final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(right: 5 ,top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), 
        image: DecorationImage( 
          image: NetworkImage("${Constants.imagePath}${snapshot.data[index].posterPath}"),fit: BoxFit.cover,
          )
      ),
    );
  }
}