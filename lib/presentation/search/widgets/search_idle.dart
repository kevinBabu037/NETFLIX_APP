import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

import '../../../api/api.dart';
import '../../../models/movies.dart';
 const imageUrl="https://i.pinimg.com/564x/1a/97/84/1a9784a78effe5ceb7580783b84e02a0.jpg";

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {

  late Future <List<Movie>> searchIdle;
  @override
  void initState() {
    super.initState();
   searchIdle = Api().searchPageIdle();
  }
 
  @override 
  Widget build(BuildContext context) { 
    
    return Column(crossAxisAlignment: CrossAxisAlignment.start,  
      children: [
       const SearchTitle(title:'Top Searches'),
              kHeight,
              Expanded(
                child: FutureBuilder(
                 future: searchIdle,
                 builder: (context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }if(snapshot.hasError){
                      return const Center(child: Text("server Busy") ,);
                    }else{
                     return ListView.separated( 
                    itemBuilder: (context, index) => TopSearchItrmTile(snapshot: snapshot,index: index), 
                    separatorBuilder: (context, index) => kHeight20 , 
                    itemCount: snapshot.data!.length
                    );
                    }
                    
                 },
                ), 
              )
      ], 
      
    ); 
  } 
}



// ignore: must_be_immutable
class TopSearchItrmTile extends StatelessWidget {
   TopSearchItrmTile({
    super.key,
    required this.snapshot,
    required this.index,
    });
  final AsyncSnapshot snapshot;
  int index;
  
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
            image: DecorationImage(
              image: NetworkImage("${Constants.imagePath}${snapshot.data[index].posterPath}"),
              fit: BoxFit.cover),
          ),
        ),
        kWidth,
        Expanded(
          child:  Text(snapshot.data[index].title,style:const TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold),),
        ),
        kWidth,
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