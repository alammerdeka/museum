part of 'pages.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    login(BuildContext context) {
      Services.login(controllerUsername.text, controllerPassword.text)
          .then((responseBody) {
        if (responseBody!.status==true) {
          User user =  responseBody;
          Session.setUser(user);
          context.read<CUser>().data = user;
          DInfo.dialogSuccess(context, 'Login Success');
          DInfo.closeDialog(context, actionAfterClose: () {
            context.go(AppRoute.loader);
          });
        } else {
          DInfo.snackBarError(context, 'Login Failed');
        }
      });
    }
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
            const SizedBox(
              height: 8,
            ),
            const Text('Email'),
            SizedBox(
              height: 8,
            ),
            Container(
              child: TextFormField(
                controller: controllerUsername,
              ),
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
                controller: controllerPassword,
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
              login(context);
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
