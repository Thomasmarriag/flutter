// import 'dart:math';
import 'package:flutter/material.dart';
import 'modelos/accesorio.dart';

class DatosPage extends StatelessWidget {
  final List<Accesorio> accesorios;

  const DatosPage({
    Key? key,
    required this.accesorios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0D0D0D), // Negro
            Color(0xFF1F1F1F), // Gris oscuro
          ],
        ),
      ),
      child: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: accesorios.length,
        itemBuilder: (context, index) {
          final accesorio = accesorios[index];
          final gradientColors = _generateUniqueGradient();
          return GestureDetector(
            onTap: () {
              final Color appBarColor = gradientColors[0];
              _showUserDetails(context, accesorio, appBarColor);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientColors,
                ),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'accesorio_foto_$index',
                    child: Image.network(
                      accesorio.foto,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${accesorio.nombre}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    accesorio.marca,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showUserDetails(BuildContext context, Accesorio accesorio, Color appBarColor) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => AccesorioDetailsPage(accesorio: accesorio, appBarColor: appBarColor),
    ));
  }

  List<Color> _generateUniqueGradient() {
    final Color color1 = Color(0xFF232526); // Gris oscuro
    final Color color2 = Color(0xFF414345); // Gris más claro
    return [color1, color2];
  }

}

class AccesorioDetailsPage extends StatelessWidget {
  final Accesorio accesorio;
  final Color appBarColor;

  const AccesorioDetailsPage({
    Key? key,
    required this.accesorio,
    required this.appBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Detalles de ${accesorio.nombre}'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              appBarColor.withOpacity(0.7),
              appBarColor.withOpacity(0.4),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'accesorio_foto_${accesorio.foto}',
                child: Image.network(
                  accesorio.foto,
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '${accesorio.nombre} ',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                accesorio.marca,
                
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),SizedBox(height: 8.0),
              Text(
                accesorio.modelo,
                
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
