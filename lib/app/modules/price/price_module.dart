import 'price_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'price_page.dart';

class PriceModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PriceController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PricePage()),
      ];

  static Inject get to => Inject<PriceModule>.of();
}
