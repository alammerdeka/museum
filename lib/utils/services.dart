part of 'utils.dart';
class Services{
   static Future<GlobalResponse?> register(
      String pengNama,
      String pengEmail,
      String pengTlp,
      String pengInstansi,
      String pengJenisKelamin,
      String pengPass,) async {
    var url = Apis.register;
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'pengNama': pengNama,
        'pengEmail': pengEmail,
        'pengTlp': pengTlp,
        'pengInstansi' : pengInstansi,
        'pengJenisKelamin' : pengJenisKelamin,
        'pengPass' : pengPass,
      });
      DMethod.printTitle('User Source - register', response.body);
      GlobalResponse responseBody =  GlobalResponse.fromJson(jsonDecode(response.body));
      return responseBody;
    } catch (e) {
      DMethod.printTitle('User Source - register', e.toString());
      return null;
    }
  }
   static Future<GlobalResponse?> putProfile(
       String pengNama,
       String pengTlp,
       String pengInstansi,
       String pengJenisKelamin,
      ) async {
     var url = Apis.putProfile;
     try {
       Response response = await Client().put(Uri.parse(url), body: {
         'pengNama': pengNama,
         'pengTlp': pengTlp,
         'pengInstansi' : pengInstansi,
         'pengJenisKelamin' : pengJenisKelamin,
       });
       DMethod.printTitle('User Source - PUT', response.body);
       GlobalResponse responseBody =  GlobalResponse.fromJson(jsonDecode(response.body));
       return responseBody;
     } catch (e) {
       DMethod.printTitle('User Source - PUT', e.toString());
       return null;
     }
   }
   static Future<User?> login(String username, String password) async {
     String url = '${Apis.login}';
     try {
       Response response = await Client().post(Uri.parse(url), body: {
         'identity': username,
         'password': password,
       });
       DMethod.printTitle('User Source - login', response.body);
       User responseBody = User.fromJson(jsonDecode(response.body));
       return responseBody;
     } catch (e) {
       DMethod.printTitle('User Source - login', e.toString());
       return null;
     }
   }
   static Future<User?> getUser(String email) async {
     String url = '${Apis.getProfileByEmail}$email';
     try {
       Response response = await Client().get(Uri.parse(url));
       DMethod.printTitle('User Source - login', response.body);
       User responseBody = User.fromJson(jsonDecode(response.body));
       return responseBody;
     } catch (e) {
       DMethod.printTitle('User Source - login', e.toString());
       return null;
     }
   }
   Future<List<Faq>>getFaq()async{
     var responseFaq = await http.get(Uri.parse(Apis.getFaq)
     );
     if(responseFaq.statusCode==200){
       print(responseFaq.body);
       List data = jsonDecode(responseFaq.body);
       List<Faq> faq = [];

       for(var itemAll in data){
         faq.add(Faq.fromJson(itemAll));
       }
       return faq;
     }else{
       throw Exception('Gagal get faq');
     }

   }
   Future<Tentang>getTentang()async{
     var response = await http.get(Uri.parse(Apis.getTentang),

     );
     print(response.body);
     if(response.statusCode==200){
       Tentang data = Tentang.fromJson(jsonDecode(response.body));

       return data;
     }else{
       Tentang data = Tentang.fromJson(jsonDecode(response.body));

       return data;
     }
   }
   Future<List<Museum>>getMuseum()async{
     var responseMuseum = await http.get(Uri.parse(Apis.getMuseum)
     );
     if(responseMuseum.statusCode==200){
       print(responseMuseum.body);
       List data = jsonDecode(responseMuseum.body);
       List<Museum> museum = [];

       for(var itemAll in data){
         museum.add(Museum.fromJson(itemAll));
       }
       return museum;
     }else{
       throw Exception('Gagal get museum');
     }

   }
   static Future<GlobalResponse?> putPassword(
       String pengEmail,
       String old,
       String baru,
       String konfirmasi_baru,
       ) async {
     var url = Apis.putPassword;
     try {
       Response response = await Client().put(Uri.parse(url), body: {
         'pengEmail': pengEmail,
         'old': old,
         'new': baru,
         'new_confirm' : konfirmasi_baru,
       });
       DMethod.printTitle('User Source - change  password', response.body);
       GlobalResponse responseBody =  GlobalResponse.fromJson(jsonDecode(response.body));
       return responseBody;
     } catch (e) {
       DMethod.printTitle('User Source - change  password', e.toString());
       return null;
     }
   }

}