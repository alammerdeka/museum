part of 'pages.dart';

class TentangPage extends StatefulWidget {
  const TentangPage({Key? key}) : super(key: key);

  @override
  State<TentangPage> createState() => _TentangPageState();
}

class _TentangPageState extends State<TentangPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  Future<void> _handleRefresh() async {
    final Completer<void> completer = Completer<void>();

    await Provider.of<TentangProvider>(context, listen: false).getTentang();

    if (context.mounted) {
      completer.complete();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TentangProvider tentangProvider = Provider.of<TentangProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.myPrimCol,
          title: Text('Tentang', style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, color: Colors.white)),),
          backwardsCompatibility: false,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: LiquidPullToRefresh(
          color: MyColor.myPrimCol,
          onRefresh: _handleRefresh,
          child: Stack(
            children: [
              Image.asset('assets/pattern_bg.png', fit: BoxFit.cover, height: MediaQuery.of(context).size.height, opacity: const AlwaysStoppedAnimation(.7),),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: Column(
                      children: [Html(data: tentangProvider.tentangs.tentangIsi!), SizedBox(height: MediaQuery.of(context).size.height,)],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
