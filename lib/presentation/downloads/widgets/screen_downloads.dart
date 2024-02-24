import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/models/movies.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class Screendownloads extends StatelessWidget {
    Screendownloads({super.key});

  final _widgetList= [
       const  _SmartDownloads(),
        const  Section2(),
        const  Section3()        
        ];

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar:const PreferredSize(preferredSize: Size.fromHeight(40),
        child: AppBarwidget(title: 'Downloads',)),
      body:ListView.separated( 
        padding:const EdgeInsets.all(10 ),
        itemBuilder: (context, index) =>_widgetList[index] , 
        separatorBuilder:(context, index) =>const SizedBox(height: 25,) ,  
        itemCount: _widgetList.length,
      )
    );
  } 
}


class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
       children: [
         Icon(Icons.settings,color: kWhite,size: 25 ,),
         Text('Smart Downloads',style: TextStyle(fontSize: 17 ),),
       ],  
     );
  }
}
/////
class Section2 extends StatefulWidget {
  const Section2({super.key});

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {

 late Future <List<Movie>> topTen;

  @override
  void initState() {
    super.initState();
      topTen=Api().getTopRatedMovies();
  }


  @override
  Widget build(BuildContext context) {
      final Size size=MediaQuery.of(context).size;
      final images=[
      "https://i.pinimg.com/564x/a7/50/5d/a7505d40958807d2af56ce04a1a3dab5.jpg",
      "https://i.pinimg.com/564x/3c/ec/06/3cec063b1bf3e17ca173eb55fe1c55b3.jpg",
      "https://i.pinimg.com/564x/51/2b/93/512b9342e30004a581b8d37566ca0564.jpg"
    ];

    return Column(
      children: [
       const Text(textAlign: TextAlign.center, 'Introducing Downloads for You',style: TextStyle(fontSize:25 ,fontWeight: FontWeight.bold),),
            kHeight,
             const Text( "We'll download a personalised selection of\n movies and shows for you , so there's\n always somthing to watch on your\n device. ",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.grey),),

             SizedBox(
              height: size.width,
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    radius: size.width*0.4,
                  ),
                   DownloadImagesWedget(images: images[2],
                   size:Size(size.width*0.58, size.width*0.4) , 
                    angle: 15,
                    margin:const EdgeInsets.only(right: 130 )
                      ), 

                      DownloadImagesWedget(images: images[1],
                       size:Size(size.width*0.58, size.width*0.4) ,
                      angle: -15 ,
                      margin:const EdgeInsets.only(left: 130) 
                     ),
 
                      DownloadImagesWedget(images: images[0], 
                       size:Size(size.width*0.65 , size.width*0.40) ,
                      margin:const EdgeInsets.only(bottom: 10,top: 25 )
                      ),
                ],
              ),
             ),
      ],
    );
  }
}

////

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ), 
                  color: kBlue,
                  onPressed: (){},
                child: const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10),
                  child:  Text('Set Up',style:TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kWhite),
                  ),
                ),
                ),
        ),
          kHeight,
               MaterialButton(
                color: kWhite,
                onPressed: (){},
              child:const Padding(
                padding:  EdgeInsets.symmetric(vertical: 10),
                child:  Text('See what you can download',style:TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kBlack),
                ),
              ),
              )
      ],
    );
  }
}

class DownloadImagesWedget extends StatelessWidget {
  const DownloadImagesWedget({
    super.key,
    required this.images,
    this.angle=0,
    required this.margin,
   required this.size,
   
    
  });

  final String images;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
   
    return Transform.rotate(
      angle:-angle*pi/180,
      child: Container(
        margin: margin,
        height: size.width,
        width: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
           color: kBlack,
           image: DecorationImage(image:NetworkImage(images),fit: BoxFit.cover)
        ),
      ),
    );
  }
}