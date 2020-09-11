import 'sac_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'sac_page.dart';

class SacModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SacController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SacPage()),
      ];

  static Inject get to => Inject<SacModule>.of();
}
