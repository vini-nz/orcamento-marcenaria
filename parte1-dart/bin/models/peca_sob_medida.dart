import 'peca.dart';

class PecaSobMedida extends Peca {
  PecaSobMedida({
    required super.descricao,
    required super.largura,
    required super.altura,
    required super.quantidade,
    required super.medidaEm,
    required this.acabamento,
    required this.prazoDias,
    super.material,
    super.precoMetroQuadrado,
  });

  final String acabamento;
  final int prazoDias;

  @override
  String ficha() =>
      '${super.ficha()}, acabamento $acabamento, prazo $prazoDias';
}
