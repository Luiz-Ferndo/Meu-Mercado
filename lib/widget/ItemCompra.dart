import 'package:flutter/material.dart';

class ItemCompra extends StatefulWidget {
  const ItemCompra({super.key});

  @override
  State<ItemCompra> createState() => _ItemCompraState();
}

class _ItemCompraState extends State<ItemCompra> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final List<String> _statusItems = <String>['Status...', 'Comprar', 'Comprado'];
  String _dropdownValue = 'Status...';

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _nameController,
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
                controller: _priceController,
                keyboardType: TextInputType.number,
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
              DropdownButton<String>(
                value: _dropdownValue,
                items: _statusItems.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _dropdownValue = v);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text.trim();
                  if (name.isEmpty) {
                    Navigator.pop(context);
                    return;
                  }
                  Navigator.pop(context, name);
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