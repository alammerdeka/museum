part of 'pages.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Image.asset(
          'assets/banner.jpg',
          fit: BoxFit.cover,
        ),
      );
    }

    Widget description() {
      return SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [
                SizedBox(height: 20,),
                Text(
                  'Selamat Datang di Aplikasi Pemandu Museum',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20,),
                Text(
                  'Museum guide designed by Pegah Navid. Connect with them on Dribbble; the global community for designers and creative professionals.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),

              ],
            ),
          ));
    }

    return Scaffold(
      body: ListView(
        children: [
          image(),
          description(),
        ],
      ),
      bottomNavigationBar: CupertinoButton(
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: Container(
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),

            child: const Center(child: Text('Lanjutkan'),),), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginPage()));
      }),
    );
  }
}
