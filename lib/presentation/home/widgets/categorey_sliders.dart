import 'package:flutter/material.dart';
import 'package:netflix_app/models/movies.dart';

import '../../widgets/main_title_with_card.dart';

Widget categorySliders({
    required BuildContext context,
    required Future<List<Movie>> categorey,
    required  String title 
     }){
       return  SizedBox(
                  child: FutureBuilder( 
                      future: categorey,
                      builder: (context, snapshot){
                      if(snapshot.hasError){
                       return const Center(child:Text('Server Busy') ,); 
                      }else if(snapshot.hasData){
                        return MainTitleWithCard(title:title,snapshot: snapshot,); 
                      }else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      },
                    ),
                ); 
   }
