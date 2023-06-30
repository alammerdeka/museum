part of 'widgets.dart';
class CardWidget extends StatelessWidget {
  const CardWidget(Video e, {Key? key, required this.video}) : super(key: key);
  final Video video;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailPage(urlVideo: video.url,)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
          Text(video.name, style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          Divider(),
          Text('If you need to access videos using http (rather than https) URLs, you will need to add the appropriate NSAppTransportSecurity permissions to your app')
        ],),
      ),
    );
  }
}
