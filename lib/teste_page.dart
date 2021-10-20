import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/controllers/obrigacao_pendente_controller.dart';
import 'package:flutter_primeiro_projeto/informacoes_page.dart';
import 'package:flutter_primeiro_projeto/models/empresa_model.dart';
import 'package:flutter_primeiro_projeto/repositories/empresa_repository.dart';
import 'package:intl/intl.dart';

class TestePage extends StatefulWidget {
  const TestePage({Key? key}) : super(key: key);

  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  int idEmpresa = -1;
  final controller = ObrigacaoPendenteController();

  _success() {
    return ListView.builder(
        itemCount: controller.obrigacoesPendentes.length,
        itemBuilder: (context, index) {
          final obrigacoes = controller.obrigacoesPendentes[index];
          final DateTime dataFormatadaEmDateTime =
              DateFormat("yyyy-MM-dd").parse(obrigacoes.competencia);
          final String dataFormatadaEmString =
              DateFormat('dd/MM/yyyy').format(dataFormatadaEmDateTime);

          return ListTile(
              leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.black))),
                child: const Icon(Icons.remove_red_eye_rounded,
                    color: Colors.black),
              ),
              title: Text(
                obrigacoes.obrigacao,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InformacoesPage(
                          obrigacao: obrigacoes,
                        )));
              },
              subtitle: Row(
                children: <Widget>[
                  Text(dataFormatadaEmString,
                      style: const TextStyle(color: Colors.black))
                ],
              ),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  color: Colors.black, size: 30.0));
        });
  }

  _error() {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              controller.start(idEmpresa);
            },
            child: const Text('Tentar Novamente')));
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _notFound() {
    return const Center(
        child: Text('Nenhum dado encontrado.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)));
  }

  _start() {
    return Container();
  }

  stateManagement(ObrigacaoPendenteState state) {
    switch (state) {
      case ObrigacaoPendenteState.start:
        return _start();
      case ObrigacaoPendenteState.loading:
        return _loading();
      case ObrigacaoPendenteState.error:
        return _error();
      case ObrigacaoPendenteState.success:
        return _success();
      case ObrigacaoPendenteState.notFound:
        return _notFound();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Select dropdown com filtro
    var selectDropDown = DropdownSearch<EmpresaModel>(
      mode: Mode.BOTTOM_SHEET,
      onFind: (_) => getEmpresas(),
      onChanged: (data) {
        idEmpresa = data!.id;
      },
      dropdownSearchDecoration: const InputDecoration(
        labelText: "Empresas",
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(),
      ),
      showSearchBox: true,
      searchFieldProps: TextFieldProps(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
          labelText: "Pesquisar",
        ),
      ),
      popupTitle: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: const Center(
          child: Text(
            'Empresas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      popupShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    );

    // Botao 'Pesquisar'
    var botaoPesquisar = ElevatedButton(
        onPressed: () {
          controller.start(idEmpresa);
        },
        child: const Text('Pesquisar'));

    // Resultados da pesquisa
    var resultadosPesquisa = Column(
      children: [
        SizedBox(
          height: 505, // fixed height
          child: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return stateManagement(controller.state.value);
            },
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Obrigações")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
        children: [
          selectDropDown,
          botaoPesquisar,
          resultadosPesquisa,
        ],
      ),
    );
  }

  Future<List<EmpresaModel>> getEmpresas() {
    return EmpresaRepository().fetchEmpresas();
  }
}
