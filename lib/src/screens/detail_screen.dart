import 'package:flutter/material.dart';
import 'package:quran_gue/src/models/get_data_by_id.dart';
import 'package:quran_gue/src/utils/custom_colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {super.key,
      required this.nomor,
      required this.nama,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti});
  final int nomor;
  final String nama;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nama)),
      body: FutureBuilder<List<GetDataById>>(
        future: getSurahById(nomor),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final surahs = snapshot.data!;
            return Container(
                child: ListView.builder(
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                GetDataById surah = surahs[index];
                return Container(
                    child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text(
                        surah.teksArab,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      )),
                      Container(
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(bottom: 15, left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 3, color: CustomColors.tealLight)),
                        child: Center(
                          child: Text(
                            surah.nomorAyat.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
              },
            ));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// class _DetailScreenState extends State<DetailScreen> {
//   Future<List<GetDataById>>? surahFuture;
//   @override
//   void initState() {
//     super.initState();
//     surahFuture = getSurahById(widget.nomor);
//   }
// }
