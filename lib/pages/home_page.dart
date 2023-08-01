part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();
  Future<void> _handleRefresh() async {
    final Completer<void> completer = Completer<void>();
    await Provider.of<MuseumProvider>(context,listen:false).getMuseumList();
    if (context.mounted) {
      completer.complete();
    }
    setState(() {
    });

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MuseumProvider museumProvider = Provider.of<MuseumProvider>(context);
    Widget listData(){
      return GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
          children:
          museumProvider.museum.map((e) => CardWidget(e, museum: e,)).toList()
      );
    }
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyColor.myPrimCol,
            title: Text('Beranda',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, color: Colors.white)),),
              backwardsCompatibility:false,centerTitle:true,
            automaticallyImplyLeading: false,),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage('assets/pattern_bg.png', ),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: LiquidPullToRefresh(
          color: MyColor.myPrimCol,
          onRefresh: _handleRefresh,
          child: listData(),
        ),
      ),
    ));
  }


}
