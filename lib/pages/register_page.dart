part of 'pages.dart';

class RegisterPage extends StatefulWidget {
   RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   String? _textGender;
   int? _intGender;
  bool _isLoading = false;
  final controllerPengNama = TextEditingController();

  final controllerPengEmail = TextEditingController();

  final controllerPengTlp = TextEditingController();

  final controllerPengInstansi = TextEditingController();

  final controllerPengPass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    register(String pengNama, String pengEmail, String pengTlp, String pengInstansi,
        String pengJenisKelamin, String pengPass){
      Services.register(
        controllerPengNama.text,
        controllerPengEmail.text,
        controllerPengTlp.text,
        controllerPengInstansi.text,
        _textGender!,
        controllerPengPass.text,
      ).then((responseBody) {
        setState(() {
          _isLoading = true;
        });
        print(responseBody);
        if (responseBody!.status==true) {
          setState(() {
            _isLoading = false;
          });
          DInfo.snackBarSuccess(context, 'Register Success');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginPage()));
        } else {
          if (responseBody!.status==false) {
            setState(() {
              _isLoading = false;
            });
            DInfo.snackBarError(context, responseBody.pengEmail!);
          } else {
            setState(() {
              _isLoading = false;
            });
            DInfo.snackBarError(context, 'Register Failed');
          }
        }
      });

    }
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar.',
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
            Text('Nama Lengkap'),
            Container(
              child: TextFormField(
                controller: controllerPengNama,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text('Email'),
            Container(
              child: TextFormField(
                controller: controllerPengEmail,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text('No. Hp'),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controllerPengTlp,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text('Instansi'),
            Container(
              child: TextFormField(
                controller: controllerPengInstansi,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text('Jenis Kelamin'),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                onTap: () {
                  _openGenderPicker(context);
                },

                readOnly: true,
decoration: InputDecoration(hintText: _textGender??'',hintStyle: TextStyle(color: Colors.black)),
              ),

            SizedBox(
              height: 8,
            ),
            Text('Kata Sandi'),
            Container(
              child: TextFormField(
                controller: controllerPengPass,
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            _isLoading?Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(child: CircularProgressIndicator(color: Colors.black,),),):CupertinoButton(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: const Center(
                    child: Text('Daftar'),
                  ),
                ),
                onPressed: () {
                  print(controllerPengTlp.text);
                  register(
                      controllerPengNama.text,
                      controllerPengEmail.text,
                    controllerPengTlp.text,
                      controllerPengInstansi.text,
                      _textGender!,
                      controllerPengPass.text,
                  );

                }),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah mempunyai akun?'),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                )
              ],
            )
          ],
        ),
      ));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            header(),
            form(),
          ],
        ),
      ),
    );
  }

   Decoration decorationContainer(
       final Color? bgColor,
       final double? radius,){
     return BoxDecoration(
       borderRadius: BorderRadius.circular(radius!),
       color: bgColor!,
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
   InputDecoration textFieldCustom(
       final String? hintText,
       ) {
     return InputDecoration(
       hintText: hintText,
       hintStyle: TextStyle(color: Colors.grey.shade400),
       contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
       border: InputBorder.none,
     );
   }
}
