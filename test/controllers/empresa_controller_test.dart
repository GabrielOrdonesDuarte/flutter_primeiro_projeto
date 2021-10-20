import 'package:flutter_primeiro_projeto/controllers/empresa_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final controller = EmpresaController();

  test('deve preencher variavel "empresas"', () async {
    expect(controller.state.value, EmpresaState.start);
    await controller.start();
    expect(controller.state.value, EmpresaState.success);
    expect(controller.empresas.isNotEmpty, true);
    print(controller.empresas);
  });
}
