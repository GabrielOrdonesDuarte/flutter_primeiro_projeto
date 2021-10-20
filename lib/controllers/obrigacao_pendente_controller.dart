import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/models/obrigacao_pendente_model.dart';
import 'package:flutter_primeiro_projeto/repositories/obrigacao_pendente_repository.dart';

class ObrigacaoPendenteController {
  List<ObrigacaoPendenteModel> obrigacoesPendentes = [];
  final repository = ObrigacaoPendenteRepository();
  final state =
      ValueNotifier<ObrigacaoPendenteState>(ObrigacaoPendenteState.start);

  Future start(idEmpresa) async {
    state.value = ObrigacaoPendenteState.loading;
    try {
      obrigacoesPendentes =
          await repository.fetchObrigacoesPendentes(idEmpresa);
      if (obrigacoesPendentes.isEmpty) {
        state.value = ObrigacaoPendenteState.notFound;
      } else {
        state.value = ObrigacaoPendenteState.success;
      }
    } catch (e) {
      state.value = ObrigacaoPendenteState.error;
    }
  }
}

enum ObrigacaoPendenteState { start, loading, success, error, notFound }
