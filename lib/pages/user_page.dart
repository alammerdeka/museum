part of 'pages.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget userInfo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Nama Lengkap',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Bayu Alamsyah',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Email',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Bayu@gmail.com',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 4,
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: userInfo(),
        ),
        bottomNavigationBar: CupertinoButton(
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200]),
              child: const Center(
                child: Text(
                  'Keluar',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            onPressed: () {
            print('goLogout');
            }),
      ),
    );
  }
}
