import 'resultados_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'resultados_page.dart';

class ResultadosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ResultadosController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ResultadosPage()),
      ];

  static Inject get to => Inject<ResultadosModule>.of();
}
