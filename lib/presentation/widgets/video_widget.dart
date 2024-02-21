import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network('https://i.pinimg.com/564x/0f/82/f2/0f82f241e5d86d7d4c60ab6d45559e01.jpg',fit: BoxFit.cover,),
        ),
        Positioned(
          bottom: 7,
          right: 7 ,
          child: CircleAvatar(
          backgroundColor: kBlack.withOpacity(0.5),
          radius: 20,
           child:const Icon(Icons.volume_off,color: kWhite,size: 20 ,)),
        ),
      ],
    );
  }
}