part of 'pages.dart';
class TentangPage extends StatelessWidget {
  const TentangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TentangProvider tentangProvider = Provider.of<TentangProvider>(context);
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tentang'),
          backwardsCompatibility:false,centerTitle:true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(children: [
              Html(data:tentangProvider.tentangs.tentangIsi!)
            ],),
          ),
        ),
      ),
    );
  }
}
