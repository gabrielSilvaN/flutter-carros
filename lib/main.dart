// Bibliotecas necessárias do dart
import 'package:flutter/material.dart';

// Bibliotecas proprietárias
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Há somente um 'MaterialApp' na aplicação, que é responsável pela configuração geral do app
    return MaterialApp(
      title: "Meu app Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


