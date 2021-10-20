import 'package:flutter_primeiro_projeto/repositories/obrigacao_pendente_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = ObrigacaoPendenteRepository();

  test('deve trazer uma lista de obrigacoes pendentes', () async {
    final list = await repository.fetchObrigacoesPendentes(665);
    expect(list[0].obrigacao, 'Balancete');
  });
}
