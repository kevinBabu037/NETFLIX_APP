import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_with_card.dart';

import 'widgets/background_img_card.dart';
 ValueNotifier<bool> scrollNotifer=ValueNotifier(true);
class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key}); 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ValueListenableBuilder(
        valueListenable:scrollNotifer ,
         builder: (context, value, child) {
           return  NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
         final ScrollDirection direction = notification.direction;
         //print(direction);
         if(direction== ScrollDirection.reverse){
          scrollNotifer.value=false;
         }else if(direction==ScrollDirection.forward){
          scrollNotifer.value=true;
         }
          return true;
        },
        child: Stack(
          children: [
            ListView(
              children:const [

                BackgroundCard(),

                MainTitleWithCard(title: 'Relesed In Past Year'), 
                kHeight15, 

                MainTitleWithCard(title:'Tranding Now'), 
                kHeight15, 
                NumberTitleCard(),
                 kHeight, 
                MainTitleWithCard(title:'Tense Dramas'), 
                  kHeight15, 
                MainTitleWithCard(title:'South Indian Cinema'),
                 kHeight, 
              ],
            ),
            
              scrollNotifer.value ?  Container(  
                  height: 90,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.4),  
                  child: Column( 
                    children: [
                      Row(
                        children: [
                          kWidth,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network('https://i.pinimg.com/564x/72/a0/50/72a0500ff35991d147a6b48e4bffc721.jpg',
                            height: 60 ,width: 60 ,  
                            ),
                          ),
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
                      ),
                     const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Tv Shows',style:kHomeTextStyle,),
                    Text('Movies',style: kHomeTextStyle,),
                    Text('Categories',style: kHomeTextStyle,)
                  ],
                )
                    ],
                  ),
                ) :kHeight,
                
          ],
        ),
      );
         },
         )
    );
  }

 
}





