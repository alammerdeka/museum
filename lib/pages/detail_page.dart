part of 'pages.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key,  required this.museum}) : super(key: key);
  final Museum museum;
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

    _controller = VideoPlayerController.network('https://${widget.museum.tautanvideo}')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(100.0)
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
          appBar: AppBar(
            backgroundColor: MyColor.myPrimCol,
            title: Text('Detail Museum'),backwardsCompatibility:false,centerTitle:true,
          ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: MyColor.myPrimCol,
              height: 400,
              child: _controller.value.isInitialized
                  ? Column(
                      children: <Widget>[
                        const SizedBox(height: 19,),
                        Expanded(

                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: SizedBox(
                              height: _controller.value.size?.height ?? 0,
                              width: _controller.value.size?.width ?? 0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: VideoPlayer(_controller)),
                            ),

                          ),
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
                                colors: const VideoProgressColors(
                                    bufferedColor: Colors.white,
                                    playedColor: Colors.redAccent),
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
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            widget.museum.museumNama!,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Ditemukan',
                      style: TextStyle(fontSize: 12, color: MyColor.myPrimCol),
                    ),
                    Text(widget.museum.museumDitemukan!),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Ditemukan Pada',
                      style: TextStyle(fontSize: 12, color: MyColor.myPrimCol),
                    ),
                    Text(widget.museum.museumDitemukanPada!),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Terbuat dari',
                      style: TextStyle(fontSize: 12, color: MyColor.myPrimCol),
                    ),
                    Text(widget.museum.museumTerbuat!),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            const Divider(),
             Text(
              '   Deskripsi',
              style: TextStyle(fontSize: 12, color: MyColor.myPrimCol),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Html(data: widget.museum.museumDeskripsi),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://${widget.museum.tautanfoto!}',
                    fit: BoxFit.cover,
                  )),
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
      ),
    ));
  }
}
