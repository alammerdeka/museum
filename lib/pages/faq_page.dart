part of 'pages.dart';
class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FaqProvider faqProvider = Provider.of<FaqProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(children: faqProvider.faqs.map((e) => Text(e.faqIsi!)).toList(),),
          ),
        ),
      ),
    );
  }
}
