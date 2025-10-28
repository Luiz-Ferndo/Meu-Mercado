import 'package:flutter/material.dart';

class ItemCompra extends StatelessWidget {
  const ItemCompra({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> lista = <String>['Status...', 'Comprar', 'Comprado'];
    String dropdownValue = lista.first;

    return Scaffold (
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Item de Compra',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome do item',
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'R\$ Valor do item',
                ),
              ),
              DropdownButton(
                value: dropdownValue,
                items: 
                  lista.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
              ),
              ElevatedButton(
                onPressed: () {
                  print('Item salvo com sucesso!');
                  Navigator.pop(context);
                },
                child: Text('salvar'),
              )
            ],                        
          ),
        ),
      ),
    );
  }
}