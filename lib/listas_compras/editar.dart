import 'package:flutter/material.dart';
import 'package:lista_compras/listas_compras/lista_de_compras.dart';

class EditarListaCompras extends StatelessWidget {
  final String titulo;
  String nomeLista;
  String dataCriacao = null;

  final TextEditingController _nomeDaListaController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  EditarListaCompras(this.titulo, {Key key, this.nomeLista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titulo),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: criarCampoTexto(),
              ),
              Expanded(
                child: criarCampoData(),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {
              gravarLista(context);
            },
            child: Text('Gravar'),
          )
        ],
      ),
    );
  }

  TextField criarCampoTexto() {
    return TextField(
                controller: _nomeDaListaController,
                decoration: InputDecoration(
                  labelText: 'Nome da Lista',
                ),
              );
  }

  TextField criarCampoData() {
    return TextField(
                controller: _dataController,
                decoration: InputDecoration(
                    labelText: "Data",
                    hintText: 'DD/MM/AAAA'
                ),
                keyboardType: TextInputType.datetime,
              );
  }

  Future<void> gravarLista(BuildContext context) async {
    nomeLista = _nomeDaListaController.text;
    dataCriacao = _dataController.text;
    lista_de_compras lista = lista_de_compras(nome: nomeLista, data: dataCriacao);
    Navigator.pop(context, lista);
  }
}
