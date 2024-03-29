import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_app/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottam_nav.dart';
import 'package:netflix_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_app/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});
  final  _pages= [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(), 
    Screendownloads()
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      body:SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
             builder: (context,int index, child) {
              return _pages[index];
             },
             ),
      ),
        bottomNavigationBar:const BottomNavigationWidget(),
    );
  }
}