part of 'pages.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
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
    Widget image() {
      return Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
        child: SizedBox(
          child: Image.asset(
            'assets/bannerin.png',
           scale: 1.4,
          ),
        ),
      );
    }

    Widget description() {
      return SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                SizedBox(height: 20,),
                Image.asset(
                  'assets/bannerin.png',
                  scale: 1.4,
                ),
                SizedBox(height: 10,),

                 Text(
                  'Selamat Datang di Aplikasi Museum Banten',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54,fontSize: 20)),
                ),
                const SizedBox(height: 20,),
                const Text(
                  '',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),

              ],
            ),
          ));
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/banner_white.jpg',height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
          ListView(
            children: [
              // image(),
              description(),
            ],
          ),
        ],
      ),
    );
  }
}
