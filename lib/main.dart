import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
  // Tạm thời dùng danh sách các file PDF mẫu. Cập nhật tên file theo file PDF trong thư mục assets/books
  final List<String> _bookFiles = ['sample1.pdf', 'sample2.pdf'];

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
            onTap: () async {
              final filePath = 'assets/books/$fileName';
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerScreen(filePath: filePath),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String filePath;

  PDFViewerScreen({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading PDF'),
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
