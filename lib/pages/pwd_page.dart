part of 'pages.dart';
class PwdPage extends StatelessWidget {
  const PwdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerPassOld = TextEditingController();
    TextEditingController controllerPassNew = TextEditingController();
    TextEditingController controllerPassConfirmNew = TextEditingController();
    var cUser = context.read<CUser>();
    putPwd(String pengEmail, String PassOld, String PassNew,
        String PassConfirmNew){
      Services.putPassword(
          pengEmail,
          PassOld,
          PassNew,
          PassConfirmNew
      ).then((responseBody) {
        print(responseBody);
        if (responseBody!.status==true) {
          DInfo.snackBarSuccess(context, 'Ubah kata sandi berhasil');
         Navigator.pop(context);
        } else {
          if (responseBody!.status==false) {
            DInfo.snackBarError(context, responseBody.pengEmail!);
          } else {
            DInfo.snackBarError(context, 'Gagal ubah kata sandi');
          }
        }
      });

    }
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text(
              'Kata sandi saat ini',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: controllerPassOld,
              decoration: InputDecoration(hintText:'', hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Kata sandi baru',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: controllerPassNew,
              decoration: InputDecoration(hintText:'', hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Ulangi kata sandi baru',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: controllerPassConfirmNew,
              decoration: InputDecoration(hintText:'', hintStyle: TextStyle(color: Colors.grey)),
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
                        color: MyColor.myPrimCol),
                    child: const Center(
                      child: Text('Ubah kata sandi'),
                    ),
                  ),
                  onPressed: () {
                    print(controllerPassOld.text);
                    print(controllerPassNew.text);
                    print(controllerPassConfirmNew.text);
                    if(controllerPassNew.text!=controllerPassConfirmNew.text){
                      DInfo.snackBarError(context, 'Kata sandi tidak sama');
                    }else{
                      putPwd(
                        cUser.data!.pengEmail!,
                        controllerPassOld.text,
                        controllerPassNew.text,
                        controllerPassConfirmNew.text,
                      );
                    }


                  }),
          ],),
        ),
      ),
    );
  }
}
