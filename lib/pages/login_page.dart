part of 'pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk.',
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    }

    Widget form() {
      return Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(
              height: 8,
            ),
            Text('Email'),
            SizedBox(
              height: 8,
            ),
            Container(
              child: TextFormField(),
            ),
            SizedBox(
              height: 8,
            ),
            Text('Kata Sandi'),
            SizedBox(
              height: 8,
            ),
            Container(
              child: TextFormField(
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CupertinoButton(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),

                  child: const Center(child: Text('Masuk'),),), onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MainPage()));
            }),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum mempunyai akun?'),
                SizedBox(width: 5,),
                TextButton(child: Text('Daftar'), onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RegisterPage()));
                },)
              ],
            )
        ],
      ),
          ));
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header(),
          form(),
        ],
      ),
    );
  }
}
