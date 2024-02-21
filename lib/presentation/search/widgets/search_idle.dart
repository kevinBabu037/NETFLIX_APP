import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';
 const imageUrl="https://i.pinimg.com/564x/1a/97/84/1a9784a78effe5ceb7580783b84e02a0.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(crossAxisAlignment: CrossAxisAlignment.start,  
      children: [
       const SearchTitle(title:'Top Searches'),
              kHeight,
              Expanded(
                child: ListView.separated( 
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>const TopSearchItrmTile() , 
                  separatorBuilder: (context, index) => kHeight20  , 
                  itemCount: 10
                  ), 
              )
      ], 
      
    ); 
  } 
}



class TopSearchItrmTile extends StatelessWidget {
  const TopSearchItrmTile({super.key});
  
  @override 
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container( 
          width:screenWidth*0.36,
          height:80, 
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(8),
            image:const DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover),
          ),
        ),
        kWidth,
       const Expanded(
          child:  Text('movie Name',style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold),),
        ),

       const CircleAvatar(
        radius: 24 ,
          backgroundColor: kWhite,
          child: CircleAvatar( 
            radius: 21.9 ,
            backgroundColor:kBlack,
            child: Icon(CupertinoIcons.play_fill,color: kWhite,), 
          ),
        )

      ],
    );
  }
}