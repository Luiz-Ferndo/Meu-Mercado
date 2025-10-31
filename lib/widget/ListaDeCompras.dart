import 'package:flutter/material.dart';

class ListaDeCompras extends StatefulWidget {
  const ListaDeCompras({super.key, required this.title});

  final String title;

  @override
  State<ListaDeCompras> createState() => _ListaDeComprasState();
}

class _ListaDeComprasState extends State<ListaDeCompras> {
  final List<String> _listas = [
    'Supermercado',
    'Farmácia',
  ];

  void _removeAt(int index) {
    setState(() {
      _listas.removeAt(index);
    });
  }

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
        itemCount: _listas.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _listas[index],
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
                      onPressed: () => _removeAt(index),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // navega para a rota /item e aguarda um possível resultado
          final result = await Navigator.pushNamed(context, '/item');
          if (result != null && result is String) {
            setState(() {
              _listas.add(result);
            });
          }
        },
        tooltip: 'Adicionar Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}