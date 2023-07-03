part of 'utils.dart';


class MuseumProvider with ChangeNotifier {
  List<Museum> _museum = [];
  List<Museum> get museum => _museum;
  set museum(List<Museum> museum) {
    _museum = museum;
    notifyListeners();
  }

  Future<void> getMuseumList() async {
    try {
      List<Museum> museum = await Services().getMuseum();
      _museum = museum;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}