import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'price_controller.dart';

class PricePage extends StatefulWidget {
  final String title;
  final String tipo;
  const PricePage({Key key, this.title = "Price", this.tipo}) : super(key: key);

  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends ModularState<PricePage, PriceController> {
  final valorController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$');
  final tempoController = TextEditingController();
  final taxaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} ${widget.tipo}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              widget.tipo == 'Financiamento'
                  ? TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.attach_money),
                        hintText: 'Valor total do financiamento',
                        labelText: 'Valor do financiamento',
                      ),
                      keyboardType: TextInputType.number,
                      controller: valorController,
                    )
                  : TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.attach_money),
                        hintText: 'Valor que seja pagar mensalmente',
                        labelText: 'Valor da parcela',
                      ),
                      keyboardType: TextInputType.number,
                      controller: valorController,
                    ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.access_alarm),
                  hintText: 'Tempo para quitação',
                  labelText: 'Em quantas vezes?',
                ),
                controller: tempoController,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.exposure),
                  hintText: 'Em qual taxa será calculado',
                  labelText: 'Taxa de Juros (%)',
                ),
                controller: taxaController,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              // Text(
              //   'Qual o tipo de juros que você deseja aplicar?',
              //   textAlign: TextAlign.center,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Radio(
              //       value: 'am',
              //       groupValue: 'tipoJuros',
              //       onChanged: (value) => print('am'),
              //     ),
              //     Text(
              //       'Ao mês (a.m)',
              //       style: new TextStyle(
              //         fontSize: 14.0,
              //       ),
              //     ),
              //     Radio(
              //       value: 'aa',
              //       groupValue: 'tipoJuros',
              //       onChanged: (value) => print('aa'),
              //     ),
              //     Text(
              //       'Ao ano (a.a)',
              //       style: new TextStyle(
              //         fontSize: 14.0,
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () {
                      var valor = valorController.numberValue;
                      var tempo = int.parse(tempoController.text);
                      var taxa = double.parse(
                          taxaController.text.replaceAll(',', '.'));

                      controller.setValores(valor, taxa, tempo);
                      showAlertDialog1(context, controller.pmt);
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  FlatButton(
                    onPressed: () {
                      valorController.clear();
                      tempoController.clear();
                      taxaController.clear();
                    },
                    child: Text(
                      "Limpar",
                    ),
                    color: Colors.grey[300],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog1(BuildContext context, double resultado) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("Mostrar Simulação"),
      onPressed: () {
        Modular.to.pushNamed('/resultados', arguments: controller.listaValores);
        print(controller.listaValores);
      },
    );
    Widget fecharButton = FlatButton(
      child: Text("Fechar"),
      onPressed: () {
        Modular.to.pop(context);
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Resultado"),
      content: Text("Você pagará RS ${resultado.toStringAsFixed(2)} por mês"),
      actions: [
        okButton,
        fecharButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
