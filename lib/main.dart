import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Book Reader App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> _bookFiles = ['sample1.prc', 'sample2.prc']; // Thay thế với tên file thực tế

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Reader'),
      ),
      body: ListView.builder(
        itemCount: _bookFiles.length,
        itemBuilder: (context, index) {
          String fileName = _bookFiles[index];
          return ListTile(
            title: Text(fileName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookReaderScreen(fileName: fileName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookReaderScreen extends StatelessWidget {
  final String fileName;

  BookReaderScreen({required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading $fileName'),
      ),
      body: Center(
        child: Text(
          'Content of $fileName will be displayed here',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
