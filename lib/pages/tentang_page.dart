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
          title: Text('Tentang'),
          backwardsCompatibility: false,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: LiquidPullToRefresh(
          color: MyColor.myPrimCol,
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                children: [Html(data: tentangProvider.tentangs.tentangIsi!), SizedBox(height: MediaQuery.of(context).size.height,)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
