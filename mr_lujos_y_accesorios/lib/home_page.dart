import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'carga_page.dart';
import 'datos_page.dart';
import 'error_page.dart';
import 'modelos/accesorio.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 89, 252),
       title: Text(
      'MR Lujos y Accesorios',
      style: TextStyle(color: Colors.black),),),
        
      body: FutureBuilder( 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if (snapshot.hasError) {
              return ErrorPage();
            } else if (snapshot.hasData) {
              return DatosPage(accesorios: snapshot.data as List<Accesorio>,);
            }
          }
          return CargaPage();
        },
        future: getList(),
      ),
    );
  }
  Future<List<Accesorio>> getList() async {
    final url = Uri.parse('https://b91b-191-156-247-142.ngrok-free.app/accesorios');
    final response = await http.get(url);
    if (response.statusCode == 200){
      final info = jsonDecode(response.body);
   
      return accesorioFromJson(jsonEncode(info));
    }else{
      throw 'Error';
    }
  }
}




