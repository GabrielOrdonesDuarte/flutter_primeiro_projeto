import 'package:flutter_primeiro_projeto/controllers/obrigacao_pendente_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final controller = ObrigacaoPendenteController();

  test('deve preencher variavel "obrigacoesPendentes"', () async {
    expect(controller.state.value, ObrigacaoPendenteState.start);
    await controller.start(665);
    expect(controller.state.value, ObrigacaoPendenteState.success);
    expect(controller.obrigacoesPendentes.isNotEmpty, true);
  });
}
