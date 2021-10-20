import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_primeiro_projeto/models/empresa_model.dart';

class EmpresaRepository {
  final dio = Dio();
  final url = '${dotenv.env['empresaRep']}';

  Future<List<EmpresaModel>> fetchEmpresas() async {
    final response = await dio.get(url,
        options: Options(headers: {
          'Cookie':
              'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiTWF0ZXVzIiwiaWQiOjMzOSwiYmFuY28iOiJLb3JvayIsImlhdCI6MTYzNDY3MzUzNCwiZXhwIjoxNjM0NzI3NTM0fQ.RgMtf_PQv2SEmju6-cwPBtXAKhENhvI9xXkAGA0oiOk',
        }));
    final list = response.data as List;
    return list.map((json) => EmpresaModel.fromJson(json)).toList();
  }
}
