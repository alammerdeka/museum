part of 'pages.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<TabItem> items = const [
    TabItem(
      icon: CupertinoIcons.square_stack,
      title: 'Beranda',
    ),
    TabItem(
      icon: CupertinoIcons.question_square_fill,
      title: 'Faq',
    ),
    TabItem(
      icon: CupertinoIcons.square_list_fill,
      title: 'Tentang',
    ),
    TabItem(
      icon: CupertinoIcons.person_crop_circle,
      title: 'Profil',
    ),
  ];
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        children: [
          HomePage(),
          FaqPage(),
          TentangPage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: Container(
        child:  BottomBarInspiredInside(
          items: items,
          backgroundColor: Colors.white,
          color: Colors.grey,
          colorSelected: Colors.white,
          indexSelected: selectedPage,
          isAnimated: true,
          onTap: (int index){
            setState(() {
              selectedPage = index;

              print(selectedPage);
            });
            pageController.jumpToPage(selectedPage);
          },
          animated: true,
          titleStyle: TextStyle(fontSize: 8),
          itemStyle: ItemStyle.circle,
          chipStyle: ChipStyle(convexBridge: true,background: MyColor.myPrimCol,notchSmoothness: NotchSmoothness.smoothEdge),
        ),
      ),
    );
  }
}
