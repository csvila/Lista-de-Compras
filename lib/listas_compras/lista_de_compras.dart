import 'package:flutter/material.dart';
import 'package:lista_compras/listas_compras/editar.dart';

class lista_de_compras extends StatelessWidget{
  final String nome;
  final String data;
  final List<lista_de_compras> _listas = List();

  lista_de_compras({this.nome, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Listas de Compras"),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Nova lista de compras',
        onPressed: () {
          final Future<lista_de_compras> novaLista = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditarListaCompras("Editar Lista");
          }));
          novaLista.then((listaRecebida){
            debugPrint('Lista recebida com nome ${listaRecebida.nome} e data ${listaRecebida.data}');
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Nome da Lista'),
            leading: null,
          ),
          ListTile(
            title: Text('Data'),
            leading: Icon(Icons.date_range),
          )
        ],
      ),
    );
  }


}