part of 'pages.dart';
class LoaderPageEmpty extends StatefulWidget {
  const LoaderPageEmpty({Key? key}) : super(key: key);

  @override
  State<LoaderPageEmpty> createState() => _LoaderPageEmptyState();
}

class _LoaderPageEmptyState extends State<LoaderPageEmpty> {

  getInit() async {
    await Provider.of<TentangProvider>(context,listen:false).getTentang();
    await Provider.of<FaqProvider>(context,listen:false).getUnitKerja();


    if (mounted) {
      Navigator.of(context);
      WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));

      });
    }
  }
  @override
  void initState() {
    super.initState();
    getInit();
  }


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: Center(child: CircularProgressIndicator()) // this will show when loading is true
             // this will show when loading is false
      ),
    );
  }
}
