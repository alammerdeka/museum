part of 'pages.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();
  Future<void> _handleRefresh() async {
    final Completer<void> completer = Completer<void>();
    await Provider.of<TentangProvider>(context,listen:false).getTentang();
    if (context.mounted) {
      completer.complete();
    }
    setState(() {
    });

  }
  @override
  Widget build(BuildContext context) {
    FaqProvider faqProvider = Provider.of<FaqProvider>(context);
    Widget listData(){
      return Column(children:
        faqProvider.faqs
            .map((e) => ListTile(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>FaqDetailPage(faq: e,)));
          },
          style: ListTileStyle.drawer,
          dense: true,
          title: Text(e.faqJudul!),
          tileColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ))
            .toList(),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.myPrimCol,
          title: Text('Faq'),
          backwardsCompatibility: false,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: LiquidPullToRefresh(
          color: MyColor.myPrimCol,
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                children: [
                  listData(),
                  SizedBox(height: MediaQuery.of(context).size.height,)
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
