
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import '../../core/constant.dart';
import 'widgets/coming_soon_widget.dart';
import 'widgets/every_one_watching.dart';


class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(preferredSize:const Size.fromHeight(90 ), 
          child: AppBar(
            title: const Text('New & Hot',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),), 
              actions: [
           const Icon(Icons.cast,color: Colors.white,size: 30 ,),
          kWidth, 
          Container(
           height: 30,
           width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image:const DecorationImage(image: NetworkImage('https://i.pinimg.com/200x/c4/88/34/c488340ad56e5454f4576f6c708b63aa.jpg'))
          ),
          ),
          kWidth
              ],
              bottom: TabBar(
                labelColor: kBlack,
                unselectedLabelColor: kWhite,
                labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: kWhite,
                  borderRadius: kborderRadius30
                ),
                tabs:const[
                Tab(child: Text('🍿Coming Soon',  
                ) ,),
               Tab( child:Text("👀Every One's Watching",
               style: TextStyle(fontWeight: FontWeight.bold), 
               ),)
              ] ),
          )
          ),
          body:TabBarView(
            children: [

              _buildComingSoon(),
              _buildEveryOneWatching(),

            ]
          )
      ),
    );
  }
  
 Widget _buildComingSoon() {
     return ListView.builder(
        itemCount: 10,
         itemBuilder: (context, index) {
          
           return const ComimgSoonWidget();
         },
      
     );
  }
}

Widget _buildEveryOneWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) { 
      return const EveryOneWatchingWidget();
    },);
}

