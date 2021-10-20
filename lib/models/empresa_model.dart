class EmpresaModel {
  int id;
  String cnpj;
  String razaoSocial;
  String? clienteDesde;
  String? clienteAte;
  int responsavelFiscal;
  String nomeResponsavelFiscal;
  int responsavelContabil;
  String nomeResponsavelContabil;
  int responsavelPessoal;
  String nomeResponsavelPessoal;
  int responsavelAdministrativo;
  String nomeResponsavelAdministrativo;
  bool ativo;
  String? tributacao;

  EmpresaModel(
      {required this.id,
      required this.cnpj,
      required this.razaoSocial,
      required this.clienteDesde,
      required this.clienteAte,
      required this.responsavelFiscal,
      required this.nomeResponsavelFiscal,
      required this.responsavelContabil,
      required this.nomeResponsavelContabil,
      required this.responsavelPessoal,
      required this.nomeResponsavelPessoal,
      required this.responsavelAdministrativo,
      required this.nomeResponsavelAdministrativo,
      required this.ativo,
      required this.tributacao});

  factory EmpresaModel.fromJson(Map json) {
    return EmpresaModel(
      id: json['ID'],
      cnpj: json['CNPJ'],
      razaoSocial: json['Razao_Social'],
      clienteDesde: json['Cliente_Desde'],
      clienteAte: json['Cliente_Ate'],
      responsavelFiscal: json['Responsavel_Fiscal'],
      nomeResponsavelFiscal: json['Nome_Responsavel_Fiscal'],
      responsavelContabil: json['Responsavel_Contabil'],
      nomeResponsavelContabil: json['Nome_Responsavel_Contabil'],
      responsavelPessoal: json['Responsavel_Pessoal'],
      nomeResponsavelPessoal: json['Nome_Responsavel_Pessoal'],
      responsavelAdministrativo: json['Responsavel_Administrativo'],
      nomeResponsavelAdministrativo: json['Nome_Responsavel_Administrativo'],
      ativo: json['Ativo'],
      tributacao: json['Tributacao'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['CNPJ'] = cnpj;
    data['Razao_Social'] = razaoSocial;
    data['Cliente_Desde'] = clienteDesde;
    data['Cliente_Ate'] = clienteAte;
    data['Responsavel_Fiscal'] = responsavelFiscal;
    data['Nome_Responsavel_Fiscal'] = nomeResponsavelFiscal;
    data['Responsavel_Contabil'] = responsavelContabil;
    data['Nome_Responsavel_Contabil'] = nomeResponsavelContabil;
    data['Responsavel_Pessoal'] = responsavelPessoal;
    data['Nome_Responsavel_Pessoal'] = nomeResponsavelPessoal;
    data['Responsavel_Administrativo'] = responsavelAdministrativo;
    data['Nome_Responsavel_Administrativo'] = nomeResponsavelAdministrativo;
    data['Ativo'] = ativo;
    data['Tributacao'] = tributacao;
    return data;
  }

  @override
  String toString() => razaoSocial;
}

// class TodoModel {
//   int userId;
//   int id;
//   String title;
//   bool completed;

//   TodoModel(
//       {required this.userId,
//       required this.id,
//       required this.title,
//       required this.completed});

//   factory TodoModel.fromJson(Map json) {
//     return TodoModel(
//         userId: json['userId'],
//         id: json['id'],
//         title: json['title'],
//         completed: json['completed']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['userId'] = userId;
//     data['id'] = id;
//     data['title'] = title;
//     data['completed'] = completed;
//     return data;
//   }
// }