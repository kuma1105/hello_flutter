import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI 연습')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover, // 사진을 주어진 화면에 채우기
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _titleWidget(),
            ),
            _iconsWidget(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  'adasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasdadasdasd'),
            )
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Column의 cross는 좌우, Row의 cross는 상하
            children: [
              Text(
                '제목',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text('부제목'),
            ],
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.red),
            Text('41'),
          ],
        ),
      ],
    );
  }

  Widget _iconsWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.call, color: Colors.cyan),
              Text('CALL', style: TextStyle(color: Colors.cyan)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.call, color: Colors.cyan),
              Text('CALL', style: TextStyle(color: Colors.cyan)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.call, color: Colors.cyan),
              Text('CALL', style: TextStyle(color: Colors.cyan)),
            ],
          ),
        ],
      ),
    );
  }
}
