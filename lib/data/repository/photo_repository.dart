import 'package:hello_flutter/data/model/photo.dart';

class PhotoRepository {
  List<Photo> photos = [
    Photo(
        url:
            'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
        description: 'KFC'),
    Photo(
        url:
            'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
        description: 'KFC'),
    Photo(
        url:
            'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
        description: 'KFC'),
    Photo(
        url:
            'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
        description: 'KFC'),
  ];

  Future<List<Photo>> getPhotos(String query) async{
    await Future.delayed(const Duration(seconds: 2));
    return photos;
  }
}
