import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_primeiro_projeto/models/obrigacao_pendente_model.dart';
import 'package:intl/intl.dart';

class ObrigacaoPendenteRepository {
  final dio = Dio();
  final url = '${dotenv.env['obrigacaoPendenteRep']}';

  Future<List<ObrigacaoPendenteModel>> fetchObrigacoesPendentes(
      idEmpresa) async {
    final DateTime dataHoje = DateTime.now();
    final String dataHojeFormatada = DateFormat('yyyy-MM-dd').format(dataHoje);
    final DateTime subtrairTresMeses =
        dataHoje.subtract(const Duration(days: 91));
    final String dataTresMesesFormatada =
        DateFormat('yyyy-MM-dd').format(subtrairTresMeses);

    final response = await dio.get(url,
        options: Options(headers: {
          'Cookie':
              'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiTWF0ZXVzIiwiaWQiOjMzOSwiYmFuY28iOiJLb3JvayIsImlhdCI6MTYzNDY3MzUzNCwiZXhwIjoxNjM0NzI3NTM0fQ.RgMtf_PQv2SEmju6-cwPBtXAKhENhvI9xXkAGA0oiOk',
        }),
        queryParameters: {
          'Cliente_Id': idEmpresa,
          'dtDe': dataTresMesesFormatada,
          'dtAte': dataHojeFormatada
        });

    final list = response.data as List;
    return list.map((json) => ObrigacaoPendenteModel.fromJson(json)).toList();
  }
}
