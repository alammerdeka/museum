part of 'pages.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
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
      return Column(children:
      museumProvider.museum.map((e) => CardWidgetList(e, museum: e,)).toList()
      );
    }
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyColor.myPrimCol,
            title: Text('Beranda'),
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
              child: SingleChildScrollView(
                child: listData(),
              ),
            ),
          ),
        ));
  }


}