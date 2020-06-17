import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simex_app/app/modules/infoClient/infoClient_controller.dart';
import 'package:simex_app/app/modules/infoClient/infoClient_module.dart';

void main() {
  initModule(InfoClientModule());
  // InfoClientController infoclient;
  //
  setUp(() {
    //     infoclient = InfoClientModule.to.get<InfoClientController>();
  });

  group('InfoClientController Test', () {
    //   test("First Test", () {
    //     expect(infoclient, isInstanceOf<InfoClientController>());
    //   });

    //   test("Set Value", () {
    //     expect(infoclient.value, equals(0));
    //     infoclient.increment();
    //     expect(infoclient.value, equals(1));
    //   });
  });
}
