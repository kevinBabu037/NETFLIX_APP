
import 'package:flutter/material.dart';
import 'package:netflix_app/api/api.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/models/movies.dart';
import '../../core/constant.dart';
import 'widgets/coming_soon_widget.dart';
import 'widgets/every_one_watching.dart';


class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {

  late Future <List<Movie>> popular;
  late Future <List<Movie>> topTen;

  @override
  void initState() {
    super.initState();
      popular=Api().getTenseDramaMovies();
      topTen=Api().getTopRatedMovies();
  }

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

              _buildComingSoon(popular),
              _buildEveryOneWatching(topTen),

            ]
          )
      ),
    );
  }

 Widget _buildComingSoon( Future <List<Movie>> categorey) {
  
     return FutureBuilder(
       future: categorey,
       builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
           return const Center(child: Text('Server Busy'));
          }else{
            return ListView.builder(
          itemCount: snapshot.data!.length,
           itemBuilder: (context, index) {
            final movie = snapshot.data?[index];
             return  ComimgSoonWidget(movie: movie!); 
           }, 
       ); 
          }
         
       },
     );
  } 
}

Widget _buildEveryOneWatching(Future <List<Movie>> categorey) {
  return  FutureBuilder(
       future: categorey,
       builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return const Center(child: Text('Server busy'),);
          }else{
              return ListView.builder(
          itemCount: snapshot.data!.length,
           itemBuilder: (context, index) {
            final movie = snapshot.data?[index];
             return  EveryOneWatchingWidget(movie: movie!,); 
     
           }, 
       );
          }
         
       },
     );
}

