part of 'utils.dart';
class Apis{
  static const String baseUrl = 'https://museum.digitaline.site/backoffice/api/';
  static const String login = '${baseUrl}login';
  static const String register = '${baseUrl}register';
  static const String getData = '${baseUrl}getData';
  static const String getFaq = '${baseUrl}faq';
  static const String getTentang = '${baseUrl}tentang';
  static const String putProfile = '${baseUrl}profil';
  static const String getProfileByEmail = '${baseUrl}profil?pengEmail=';
  static const String getMuseum = '${baseUrl}museum';
  static const String putPassword = '${baseUrl}profil/password';
}