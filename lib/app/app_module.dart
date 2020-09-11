import 'package:querpagarquanto/app/modules/price/price_controller.dart';
import 'package:querpagarquanto/app/modules/sac/sac_controller.dart';
import 'package:querpagarquanto/app/modules/sac/sac_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:querpagarquanto/app/app_widget.dart';
import 'package:querpagarquanto/app/modules/home/home_module.dart';

import 'modules/price/price_page.dart';
import 'modules/resultados/resultados_controller.dart';
import 'modules/resultados/resultados_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => SacController()),
        Bind((i) => PriceController()),
        Bind((i) => ResultadosController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(
          '/sac/:tipo',
          child: (_, args) => SacPage(tipo: args.params['tipo']),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter(
          '/price/:tipo',
          child: (_, args) => PricePage(tipo: args.params['tipo']),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter(
          '/resultados',
          child: (_, args) => ResultadosPage(valores: args.data),
          transition: TransitionType.fadeIn,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
