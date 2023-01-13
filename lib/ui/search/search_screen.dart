import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/search/search_view_model.dart';
import 'package:provider/provider.dart';

// Alt + Enter
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose(); // 메모리 누수 방지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

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
              controller: textController, // 사용자가 입력한 값 가져오기
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
                // suffixText: 'USD',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    print('확인! : ${textController.text}');
                    await viewModel.search(textController.text);
                  },
                ),
                suffixStyle: TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(height: 16),
            if (viewModel.isLoading) CircularProgressIndicator(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: viewModel.photos.length,
                itemBuilder: (BuildContext context, int index) {
                  final photo = viewModel.photos[index]; // final <-> var
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      photo.url,
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
