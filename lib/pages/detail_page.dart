part of 'pages.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.urlVideo}) : super(key: key);
  final String urlVideo;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late VideoPlayerController _controller;
  int _currentIndex = 0;
  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= videos.length) return;
    if(!init){
      _controller.pause();
    }
    setState(()=>_currentIndex = index);

    _controller = VideoPlayerController.network(widget.urlVideo)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(1.0)
      ..initialize().then((value) => _controller.play());
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(6));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    super.initState();
    _playVideo(init: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 300,
            child: _controller.value.isInitialized
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: VideoPlayer(_controller),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                            height: 2,
                            child: VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(playedColor: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 12),
                            ),
                          )),
                          // ValueListenableBuilder(
                          //     valueListenable: _controller,
                          //     builder:
                          //         (context, VideoPlayerValue value, child) {
                          //       return Text(
                          //         _videoDuration(value.position),
                          //         style: TextStyle(color: Colors.white),
                          //       );
                          //     }),
                        ],
                      ),
                      IconButton(
                          onPressed: () => _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play(),
                          icon: Icon(
                            _controller.value.isPlaying
                                ? CupertinoIcons.pause_circle_fill
                                : CupertinoIcons.play_arrow_solid,
                            color: Colors.white,
                          ))
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: videos.length,
          //       itemBuilder: (context, index) {
          //         return InkWell(
          //           onTap: ()=>_playVideo(index: index),
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 12),
          //             child: Row(
          //               children: [
          //                 SizedBox(
          //                   height: 100,
          //                   width: 100,
          //                   child: Image.network(
          //                     videos[index].thumbnail,
          //                     fit: BoxFit.contain,
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          // )
        ],
      ),
    ));
  }
}
