import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran_gue/src/services/constrants.dart';

class GetData {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, dynamic> audioFull;

  GetData({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
  });

  factory GetData.fromJson(Map<String, dynamic> json) => GetData(
        nomor: json['nomor'],
        nama: json['nama'],
        namaLatin: json['namaLatin'],
        jumlahAyat: json['jumlahAyat'],
        tempatTurun: json['tempatTurun'],
        arti: json['arti'],
        deskripsi: json['deskripsi'],
        audioFull: json['audioFull'],
      );
}

Future<List<GetData>> getSurahs() async {
  final response = await http.get(Uri.parse(GetApiService.getSurah));

  if (response.statusCode == 200) {
    // Konversi response ke Map
    var data = jsonDecode(response.body)['data'];
    // data.remove('audioFull');

    data = data.map((json) => GetData.fromJson(json)).toList();

    List<GetData> results = [];

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
