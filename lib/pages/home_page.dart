part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MuseumProvider museumProvider = Provider.of<MuseumProvider>(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Beranda'),
              backwardsCompatibility:false,centerTitle:true,
            automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Column(
          children:
          museumProvider.museum.map((e) => CardWidget(e, museum: e,)).toList()
            ,
        ),
      ),
    ));
  }


}
