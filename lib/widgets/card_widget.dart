part of 'widgets.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(Museum e, {Key? key, required this.museum})
      : super(key: key);
  final Museum museum;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailPage(
                  museum: museum,
                )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(spreadRadius: 2,blurRadius: 2,color: Colors.grey.withOpacity(0.2))]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://${museum.tautanfoto!}',
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        museum.museumNama!,
                        style: const TextStyle(fontSize: 18),
                      ), Text(
                        'Deskripsi',
                        style: TextStyle(fontSize: 12, color: MyColor.myPrimCol),
                      ),
                      SizedBox(
                          height: 100,
                          child: Html(data: museum.museumDeskripsi)),
                      const SizedBox(height: 8,),
                      Row(
                        children: [
                          const Icon(CupertinoIcons.clock_fill,color: Colors.grey, size: 18,),
                          const SizedBox(
                            width: 4,
                          ),

                          Text(museum.museumDibuatPada!,style: TextStyle(fontSize: 12),)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),


          ],
        ),
      ),
    );
  }
}
