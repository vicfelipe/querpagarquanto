import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'resultados_controller.dart';

class ResultadosPage extends StatefulWidget {
  final String title;
  final List valores;
  const ResultadosPage({Key key, this.title = "Resultados", this.valores})
      : super(key: key);

  @override
  _ResultadosPageState createState() => _ResultadosPageState();
}

class _ResultadosPageState
    extends ModularState<ResultadosPage, ResultadosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            createTable(widget.valores),
          ],
        ),
      ),
    );
  }
}

Widget createTable(List valores) {
  List<TableRow> rows = [];
  rows.add(TableRow(children: [
    Text(
      "Parcela",
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
    Text(
      "Valor",
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
    Text(
      "Juros",
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
    Text(
      "Amort.",
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
    Text(
      "Saldo Dev.",
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  ]));
  for (int i = 0; i < valores.length; ++i) {
    rows.add(TableRow(children: [
      TableCell(
          child: Text(
        "$i",
        style: TextStyle(height: 3),
      )),
      TableCell(
          child: Text(
        "${valores[i][0]}",
        style: TextStyle(height: 3),
      )),
      TableCell(
          child: Text(
        "${valores[i][1]}",
        style: TextStyle(height: 3),
      )),
      TableCell(
          child: Text(
        "${valores[i][2]}",
        style: TextStyle(height: 3),
      )),
      TableCell(
          child: Text(
        "${valores[i][3]}",
        style: TextStyle(height: 3),
      )),
    ]));
  }
  return Table(children: rows);
}
