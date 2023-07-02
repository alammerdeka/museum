part of 'utils.dart';
class FaqProvider with ChangeNotifier {
  List<Faq> _faq = [];
  List<Faq> get faqs => _faq;
  set faqs(List<Faq> faqs) {
    _faq = faqs;
    notifyListeners();
  }

  Future<void> getUnitKerja() async {
    try {
      List<Faq> faqs = await Services().getFaq();
      _faq = faqs;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}