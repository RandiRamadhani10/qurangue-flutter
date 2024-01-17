import 'package:quran_gue/src/models/get_data.dart';
import 'package:flutter/material.dart';
import 'package:quran_gue/src/screens/detail_screen.dart';
import 'package:quran_gue/src/utils/custom_colors.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Surat'),
      ),
      body: FutureBuilder<List<GetData>>(
        future: getSurahs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final surahs = snapshot.data!;
            return ListView.builder(
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                GetData surah = surahs[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          nama: surah.namaLatin,
                          nomor: surah.nomor,
                          jumlahAyat: surah.jumlahAyat,
                          arti: surah.arti,
                          tempatTurun: surah.tempatTurun,
                        ),
                      ),
                    );
                  },
                  child: Container(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 3, color: CustomColors.tealLight)),
                              child: Center(
                                child: Text(
                                  surah.nomor.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                surah.namaLatin,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(surah.arti),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                );
              },
            );
          } else if (snapshot.hasError) {
            // print(snapshot.error);
            return Text('Error: ${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
