part of 'pages.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);
  String? _textGender;
  int? _intGender;

  final controllerPengNama = TextEditingController();

  final controllerPengEmail = TextEditingController();

  final controllerPengTlp = TextEditingController();

  final controllerPengInstansi = TextEditingController();

  final controllerPengPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cUser = context.read<CUser>();
    logout(BuildContext context) {
      DInfo.dialogConfirmation(
        context,
        'Logout',
        'Tap Yes to confirm',
      ).then((yes) {
        if (yes ?? false) {
          Session.clearUser().then((success) {
            if (success) {
              context.read<CUser>().data = null;
              context.go(AppRoute.login);
            }
          });
        }
      });
    }
    login(BuildContext context) {
      Services.getUser(cUser.data!.pengEmail!)
          .then((responseBody) {
        if (responseBody!.pengId != null) {
          User user =  responseBody;
          Session.setUser(user);
          context.read<CUser>().data = user;
          DInfo.dialogSuccess(context, 'Update Success');
          DInfo.closeDialog(context, actionAfterClose: () {
            context.go(AppRoute.loader);
          });
        } else {
          DInfo.snackBarError(context, 'Update Failed');
        }
      });
    }
    register(String pengNama, String pengEmail, String pengTlp, String pengInstansi,
        String pengJenisKelamin){
      Services.putProfile(
        pengNama,
        pengEmail,
          pengTlp,
          pengInstansi,
          pengJenisKelamin
      ).then((responseBody) {
        print(responseBody);
        if (responseBody!.status==true) {
          DInfo.snackBarSuccess(context, 'Ubah Profil Berhasil');
          login(context);
        } else {
          if (responseBody!.status==false) {
            DInfo.snackBarError(context, responseBody.pengEmail!);
          } else {
            DInfo.snackBarError(context, 'Gagal Ubah Profil');
          }
        }
      });

    }

    Widget userInfo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Text(
            'Nama Lengkap',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controllerPengNama,
            decoration: InputDecoration(hintText: cUser.data!.pengNama??'', hintStyle: TextStyle(color: Colors.black)),
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
          TextFormField(
            controller: controllerPengEmail,
            decoration: InputDecoration(hintText:  cUser.data!.pengEmail??'', hintStyle: TextStyle(color: Colors.black)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Instansi',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controllerPengInstansi,
            decoration: InputDecoration(hintText:   cUser.data!.pengInstansi??'', hintStyle: TextStyle(color: Colors.black)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'No Hp',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controllerPengTlp,
            decoration: InputDecoration(hintText:   cUser.data!.pengTlp??'', hintStyle: TextStyle(color: Colors.black)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Jenis Kelamin',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(hintText:    _textGender??cUser.data!.pengJenisKelamin??'', hintStyle: TextStyle(color: Colors.black)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Kata Sandi',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controllerPengPass,
            obscureText: true,
            decoration: InputDecoration(hintText:   '*******', hintStyle: TextStyle(color: Colors.black)),
          ),
          SizedBox(
            height: 4,
          ),
          CupertinoButton(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: const Center(
                  child: Text('Simpan Perubahan'),
                ),
              ),
              onPressed: () {
                print(controllerPengNama.text);
                print(controllerPengEmail.text);
                print(controllerPengTlp.text);
                print(controllerPengInstansi.text);
                register(
                  controllerPengNama.text.isEmpty?cUser.data!.pengNama!:controllerPengNama.text,
                  controllerPengEmail.text.isEmpty?cUser.data!.pengEmail!:controllerPengEmail.text,
                  controllerPengTlp.text.isEmpty?cUser.data!.pengTlp!:controllerPengTlp.text,
                  controllerPengInstansi.text.isEmpty?cUser.data!.pengInstansi!:controllerPengInstansi.text,
                  _textGender==null?cUser.data!.pengJenisKelamin!:_textGender!
                );

              }),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            cUser.data==null?SizedBox():userInfo()
          ],),
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
              logout(context);
            print('goLogout');
            }),
      ),
    );
  }
}
