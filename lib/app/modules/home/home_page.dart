import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Quer pagar quanto?"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // ListTile(
          //   title: Text("Simular parcelamento SAC"),
          //   subtitle: Text('Saiba o total pago ao fim do período.'),
          //   leading: Icon(
          //     Icons.attach_money,
          //     size: 50,
          //   ),
          //   trailing: Icon(Icons.launch),
          //   onTap: () {
          //     Modular.to.pushNamed('/sac/Parcelamento');
          //   },
          // ),
          // ListTile(
          //   title: Text("Simular parcelamento PRICE"),
          //   subtitle: Text('Saiba o total pago ao fim do período.'),
          //   leading: Icon(
          //     Icons.attach_money,
          //     size: 50,
          //   ),
          //   trailing: Icon(Icons.launch),
          //   onTap: () {
          //     Modular.to.pushNamed('/price/Parcelamento');
          //   },
          // ),
          ListTile(
            title: Text("Simular Financiamento SAC"),
            subtitle: Text('Quero saber quanto vou pagar por mês.'),
            leading: Icon(
              Icons.attach_money,
              size: 50,
            ),
            trailing: Icon(Icons.launch),
            onTap: () {
              Modular.to.pushNamed('/sac/Financiamento');
            },
          ),
          ListTile(
            title: Text("Simular Financiamento PRICE"),
            subtitle: Text('Quero saber quanto vou pagar por mês.'),
            leading: Icon(
              Icons.attach_money,
              size: 50,
            ),
            trailing: Icon(Icons.launch),
            onTap: () {
              Modular.to.pushNamed('/price/Financiamento');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Desenvolvido por Victor Alencastro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
