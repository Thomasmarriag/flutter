import 'package:flutter/material.dart';
import 'package:mr_lujos_y_accesorios/login.dart';

// import 'home_page.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'MR lujos y accesorios',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
     );
  }
  
}

