import 'package:flutter/material.dart';

// Alt + Enter
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('이미지 검색'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Search',
                // helperText: 'Keep it short, this is just a demo.',
                // labelText: 'Life story',
                // prefixIcon: Icon(
                //   Icons.person,
                //   color: Colors.green,
                // ),
                // prefixText: ' ',
                suffixText: 'USD',
                suffixIcon: Icon(Icons.search),
                suffixStyle: TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 13,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      'https://play-lh.googleusercontent.com/MQDfTBh4VBrD4MQt5hX4b26OnGb9l57_pBWaBFw-mvfrfwOY9aHcwgF2mtDKvE0W-Bw',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
