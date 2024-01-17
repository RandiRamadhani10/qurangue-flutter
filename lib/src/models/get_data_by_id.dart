import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran_gue/src/services/constrants.dart';

class GetDataById {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final Map<String, dynamic> audio;

  GetDataById({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  factory GetDataById.fromJson(Map<String, dynamic> json) => GetDataById(
        nomorAyat: json['nomorAyat'],
        teksArab: json['teksArab'],
        teksLatin: json['teksLatin'],
        teksIndonesia: json['teksIndonesia'],
        audio: json['audio'],
      );
}

Future<List<GetDataById>> getSurahById(int nomor) async {
  final response =
      await http.get(Uri.parse(GetApiService.getSurah + '/$nomor'));

  if (response.statusCode == 200) {
    // Konversi response ke Map
    var data = jsonDecode(response.body)['data']['ayat'];
    // data.remove('audioFull');

    data = data.map((json) => GetDataById.fromJson(json)).toList();
    List<GetDataById> results = [];

    for (var item in data) {
      results.add(item);
    }

    return results;

    // return GetData.fromJson(
    //     jsonDecode(response.body)['data'] as Map<String, dynamic>);
    // return surahs;
  } else {
    throw Exception('Request failed with status code ${response.statusCode}');
  }
}
