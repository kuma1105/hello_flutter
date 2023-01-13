import 'dart:convert';

import 'package:hello_flutter/data/model/photo.dart';
import 'package:http/http.dart' as http;

import '../dto/photo_result.dart';

class PhotoRepository {
  // List<Photo> photos = [
  //   Photo(
  //       url:
  //           'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
  //       description: 'KFC'),
  //   Photo(
  //       url:
  //           'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
  //       description: 'KFC'),
  //   Photo(
  //       url:
  //           'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
  //       description: 'KFC'),
  // ];

  Future<List<Photo>> getPhotos(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo&pretty=true'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final photoResult = PhotoResult.fromJson(json);

      if (photoResult.hits == null) {
        return [];
      } else {
        return photoResult.hits!
            .where((e) => e.webformatURL != null)
            .map((e) => Photo(url: e.webformatURL!, description: e.tags ?? ''))
            .toList();
      }
    } else {
      throw Exception('die : ${response.statusCode}');
    }
  }
}
