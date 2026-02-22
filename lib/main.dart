import 'package:flutter/material.dart';//contine la in formacion de runApp y de material app
import 'Pantallas.principales/pantalla.configuracion.dart';
void main (){

  /*Es el el wigth inicial, es decir las configuraciones
  iniciales de la aplicacion */
  runApp(MyApp());

}

//clase que hereda de statelessWidget, 
//es decir que no tiene estado,
// es decir que no cambia
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:configuracion(),
    );
  }
}
//scaffold es una plantilla que nos permite crear una aplicacion con una barra de navegacion, un cuerpo, etc.