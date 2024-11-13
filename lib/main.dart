import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

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
  Future<List<String>> _loadBookFiles() async {
    // Giả sử bạn đã biết tên file, ở đây có thể thay thế bằng cách đọc thư mục
    return ['sample1.prc', 'sample2.prc']; // Thay thế với tên file PRC thực tế của bạn
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Reader'),
      ),
      body: FutureBuilder<List<String>>(
        future: _loadBookFiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading books'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No books available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String fileName = snapshot.data![index];
                return ListTile(
                  title: Text(fileName),
                  onTap: () {
                    // Placeholder action khi bấm vào sách
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Opening $fileName')),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
