import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant.dart';
  import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
 import 'package:netflix_app/presentation/search/widgets/search_result.dart';

import '../../api/api.dart';
import '../../models/movies.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState(); 
}

class _ScreenSearchState extends State<ScreenSearch> {

  
   late Future <List<Movie>> searchResult;
  
   @override
  void initState() {
    super.initState();
    searchResult = Future.value([]);
  }

  final searchControler=TextEditingController();
  final  _formKey = GlobalKey<FormState>();

   void onSearchTextChanged(String newText) {
    if (newText.isEmpty) {
      setState(() {
        searchResult = Future.value([]);
      });
    } else {
      setState(() {
        searchResult = Api().searchResult(newText);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey, 
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoSearchTextField(  
                  onChanged: onSearchTextChanged,
                   controller: searchControler, 
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  suffixIcon:const Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,) ,
                  prefixIcon:const Icon(CupertinoIcons.search,color: Colors.grey,),
                  style:const TextStyle(color: Colors.white),
                ),
                kHeight, 
                  
                  Expanded(
                child: searchControler.text.isEmpty
                    ? const SearchIdleWidget() 
                    : FutureBuilder(
                        future: searchResult,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const  Center(child: Text("No Result Found"));
                          } else {
                            return SearchResultWidget(snapshot: snapshot);
                          }
                        }
                        ),
                      ),
                
              ], 
            ),
          ),
        ),
      )
    );
  }
} 