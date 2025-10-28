import 'package:flutter/material.dart';

class ListaDeCompras extends StatelessWidget {
  const ListaDeCompras({super.key, required String title});

  final listas = const [
    "Supermercado",
    "Farmácia",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.shopping_cart, color: Colors.brown, size: 30),
        title: Text(
          "Minhas Listas de Compras",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, size: 30),
            tooltip: 'Menu',
            onPressed: () {
              // Ação do botão de menu
            },
          )
        ],
      ),

      body: ListView.builder(        
        itemCount: listas.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listas[index],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Toque para mais detalhes sobre a lista",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.delete, size: 20, color: Colors.red),
                      onPressed: () {
                        // Funcionalidade para excluir a lista
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Adicionar novo item');

          Navigator.pushNamed(context, '/item');
        },
        tooltip: 'Adicionar Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}