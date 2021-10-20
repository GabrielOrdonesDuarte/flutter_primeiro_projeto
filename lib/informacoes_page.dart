import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/obrigacao_pendente_model.dart';

class InformacoesPage extends StatelessWidget {
  const InformacoesPage({Key? key, required this.obrigacao}) : super(key: key);
  final ObrigacaoPendenteModel obrigacao;

  @override
  Widget build(BuildContext context) {
    final DateTime dataFormatadaEmDateTime =
        DateFormat("yyyy-MM-dd").parse(obrigacao.competencia);
    final String dataFormatadaEmString =
        DateFormat('dd/MM/yyyy').format(dataFormatadaEmDateTime);

    return Scaffold(
      appBar: AppBar(title: const Text("Detalhes")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Razão Social:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text(obrigacao.razaoSocial),
              horizontalTitleGap: 3232.0,
            ),
            ListTile(
              title: const Text('CNPJ:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text(obrigacao.cnpj),
            ),
            ListTile(
              title: const Text('Tributação:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text(obrigacao.tributacao),
            ),
            ListTile(
              title: const Text('Obrigação:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text(obrigacao.obrigacao),
            ),
            ListTile(
              title: const Text('Competência:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text(dataFormatadaEmString),
            ),
          ],
        ),
      ),
    );
  }
}
