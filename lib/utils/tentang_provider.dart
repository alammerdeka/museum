part of 'utils.dart';
class TentangProvider with ChangeNotifier {
  Tentang? _tentang;
  Tentang get tentangs => _tentang!;
  set tentangs(Tentang newMaintenance) {
    _tentang = newMaintenance;
    notifyListeners();
  }

  Future<Tentang?> getTentang() async {
    try {
      Tentang tentangs = await Services().getTentang();
      _tentang = tentangs;
    } catch (e) {
      print(e);
    }
    return _tentang;
  }

}