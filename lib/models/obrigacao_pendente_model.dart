class ObrigacaoPendenteModel {
  String razaoSocial;
  String cnpj;
  String tributacao;
  String obrigacao;
  String competencia;

  ObrigacaoPendenteModel(
      {required this.razaoSocial,
      required this.cnpj,
      required this.tributacao,
      required this.obrigacao,
      required this.competencia});

  factory ObrigacaoPendenteModel.fromJson(Map json) {
    return ObrigacaoPendenteModel(
      razaoSocial: json['Razao_Social'],
      cnpj: json['CNPJ'],
      tributacao: json['Tributacao'],
      obrigacao: json['Obrigacao'],
      competencia: json['Competencia'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Razao_Social'] = razaoSocial;
    data['CNPJ'] = cnpj;
    data['Tributacao'] = tributacao;
    data['Obrigacao'] = obrigacao;
    data['Competencia'] = competencia;
    return data;
  }
}
