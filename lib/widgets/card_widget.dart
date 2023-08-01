part of 'widgets.dart';

class CardWidget extends StatefulWidget {
  const CardWidget(Museum e, {Key? key, required this.museum})
      : super(key: key);
  final Museum museum;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailPage(
                  museum: widget.museum,
                )));
      },
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://${widget.museum.tautanfoto!}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
