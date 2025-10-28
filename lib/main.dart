import 'package:flutter/material.dart';

import 'widget/ItemCompra.dart';
import 'widget/ListaDeCompras.dart';

void main() {
  runApp(const MeuMercadoApp());
}

class MeuMercadoApp extends StatelessWidget {
  const MeuMercadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Mercado App',
      theme: ThemeData(      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //Rotas
      initialRoute: '/',
      routes: {
        '/': (context) => const ListaDeCompras(title: 'Minha Lista de Compras'),
        '/item': (context) => const ItemCompra(),
      },
      
      debugShowCheckedModeBanner: false,
    );
  }
}


