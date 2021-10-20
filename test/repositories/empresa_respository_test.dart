import 'package:flutter_primeiro_projeto/repositories/empresa_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = EmpresaRepository();

  test('deve trazer uma lista de empresas', () async {
    final list = await repository.fetchEmpresas();
    expect(list[0].razaoSocial, '@UMAMAEPEDIATRA SERVICOS EM SAUDE LTDA');
  });
}
