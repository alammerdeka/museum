part of 'pages.dart';
class LoaderPageEmpty extends StatefulWidget {
  const LoaderPageEmpty({Key? key}) : super(key: key);

  @override
  State<LoaderPageEmpty> createState() => _LoaderPageEmptyState();
}

class _LoaderPageEmptyState extends State<LoaderPageEmpty> {

  getInit() async {
    await Provider.of<MuseumProvider>(context,listen:false).getMuseumList();
    await Provider.of<TentangProvider>(context,listen:false).getTentang();
    await Provider.of<FaqProvider>(context,listen:false).getUnitKerja();
    if (context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainPage()));
    }


  }
  @override
  void initState() {
    super.initState();
    getInit();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
        bottomNavigationBar: Container(
            height: 60,
            padding: EdgeInsets.only(bottom: 20),
            child: Center(child: const CircularProgressIndicator(color: Colors.white,))),// this will show when loading is true
          // this will show when loading is false


      ),
    );
  }
}
