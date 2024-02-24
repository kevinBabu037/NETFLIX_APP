
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:video_player/video_player.dart';

class VideoListItems extends StatefulWidget {
  const VideoListItems({
    super.key,
     required this.videoUrl
    });
 
     final String videoUrl;

  @override
  State<VideoListItems> createState() => _VideoListItemsState();
}

class _VideoListItemsState extends State<VideoListItems> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    final url = Uri.parse(widget.videoUrl);
    _controller = VideoPlayerController.networkUrl(url,)..initialize().then((_) {
      setState(() {
      _controller.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          SizedBox(
            height: double.infinity,
            child:_controller.value.isInitialized ?
             AspectRatio(aspectRatio: _controller.value.aspectRatio,child: 
             VideoPlayer(_controller),) :
             const Center(child: CircularProgressIndicator(),)
          ),
        Align(alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              //left side//
              Padding(
                padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: kBlack.withOpacity(0.5),
                  radius: 26,
                  child:const Icon(Icons.volume_off,color: kWhite,size: 27,)),
              ),
                 
                 ///right side///
                
                const Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Padding(
                      padding: EdgeInsets.symmetric(vertical: 8 ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                    VideoActionIcons(icon: Icons.emoji_emotions, text: " LOL"),
                    VideoActionIcons(icon: Icons.add, text: "My List"),
                    VideoActionIcons(icon: Icons.share, text: "Share"),
                    VideoActionIcons(icon: Icons.play_arrow, text: "Play", ),
                  ],
                 )

            ],
          ),
        ) 
      ],
    ) ;
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VideoActionIcons extends StatelessWidget {
  const VideoActionIcons({super.key ,required this.icon, required this.text,this.onTap});
   final IconData icon;
   final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 8 ),
      child: Column(
        children: [
          Icon(icon,color: kWhite,size: 27,),
          Text(text,style: const TextStyle(fontSize: 16),),
        ],
      ),
    ) ;
  }
}