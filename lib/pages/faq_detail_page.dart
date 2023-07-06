part of 'pages.dart';
class FaqDetailPage extends StatelessWidget {
  const FaqDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faq Detail'),
        backwardsCompatibility:false,centerTitle:true,

      ),
      body: Column(children: [
        Text('data')
      ],),
    );
  }
}
