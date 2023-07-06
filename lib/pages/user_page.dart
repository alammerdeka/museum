part of 'pages.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
        textNo:'Tidak',
        textYes:'Ya',
        context,
        'Keluar',
        'Tekan Ya untuk keluar',
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
    register(String pengEmail, String pengNama, String pengTlp, String pengInstansi,
        String pengJenisKelamin){
      Services.putProfile(
        pengEmail,
        pengNama,
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
            onTap:(){
              _openGenderPicker(context);
            } ,
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
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PwdPage()));
            } ,
            readOnly: true,
            decoration: InputDecoration(hintText:'Klik untuk ubah kata sandi', hintStyle: TextStyle(color: Colors.black)),
          ),
          SizedBox(
            height: 4,
          ),
          // Text(
          //   'Kata Sandi',
          //   style: TextStyle(fontSize: 14),
          // ),
          // SizedBox(
          //   height: 4,
          // ),
          // TextFormField(
          //   controller: controllerPengPass,
          //   obscureText: true,
          //   decoration: InputDecoration(hintText:   '*******', hintStyle: TextStyle(color: Colors.black)),
          // ),
          // SizedBox(
          //   height: 4,
          // ),
          CupertinoButton(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColor.myPrimCol),
                child: const Center(
                  child: Text('Simpan Perubahan'),
                ),
              ),
              onPressed: () {
                print(controllerPengNama.text);
                print(controllerPengTlp.text);
                print(controllerPengInstansi.text);
                register(
                  cUser.data!.pengEmail!,
                  controllerPengNama.text.isEmpty?cUser.data!.pengNama!:controllerPengNama.text,
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
        appBar: AppBar(title: Text('Profil'),
          backwardsCompatibility:false,centerTitle:true,
          automaticallyImplyLeading: false,),
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

  void _openGenderPicker(BuildContext context) {
    BottomPicker(
      items: const [
        Text('Laki-laki',style: TextStyle(color: Colors.black),),
        Text('Perempuan'),
      ],
      title: 'Jenis Kelamin',
      pickerTextStyle: const TextStyle(
        color: Colors.black,
      ),
      onChange: (index) {
        setState(() {

        });
        _textGender = null;
        _intGender = index;
        _intGender == 0
            ? _textGender = 'Laki-laki'
            : _textGender = 'Perempuan';
        print(_textGender);

      },
      onSubmit: (index) {
        setState(() {

        });
        _textGender = null;
        _intGender = index;
        _intGender == 1
            ? _textGender = 'Perempuan'
            : _textGender = 'Laki-laki';
        print(_textGender);

      },
      buttonText: 'Konfirmasi',
      displayButtonIcon: false,
      buttonTextStyle: const TextStyle(color: Colors.white),
      buttonSingleColor: Colors.black,
    ).show(context);
  }
}
