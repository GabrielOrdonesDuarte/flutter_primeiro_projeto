import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/models/empresa_model.dart';
import 'package:flutter_primeiro_projeto/repositories/empresa_repository.dart';

class EmpresaController {
  List<EmpresaModel> empresas = [];
  final repository = EmpresaRepository();
  final state = ValueNotifier<EmpresaState>(EmpresaState.start);

  Future start() async {
    state.value = EmpresaState.loading;
    try {
      empresas = await repository.fetchEmpresas();
      state.value = EmpresaState.success;
    } catch (e) {
      state.value = EmpresaState.error;
    }
  }
}

enum EmpresaState { start, loading, success, error }
