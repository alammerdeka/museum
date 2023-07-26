part of 'pages.dart';
class FaqDetailPage extends StatelessWidget {
  const FaqDetailPage({Key? key, required this.faq}) : super(key: key);
  final Faq faq;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.myPrimCol,
          title: Text('Faq Detail'),
          backwardsCompatibility:false,centerTitle:true,

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(faq.faqJudul!),
              SizedBox(height: 10,),
              Text(faq.faqIsi!),
            ],),
          ),
        ),
      ),
    );
  }
}
