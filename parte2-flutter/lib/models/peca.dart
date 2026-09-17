class Peca {
  Peca({
    required this.descricao,
    required this.largura,
    required this.altura,
    required this.quantidade,
    required this.medidaEm,
    this.material = 'MDF 15mm',
    this.precoMetroQuadrado = 320.00,
  });

  final String descricao;
  final double largura;
  final double altura;
  final int quantidade;
  final DateTime medidaEm;
  final String material;
  final double precoMetroQuadrado;

  double get area => largura * altura * quantidade;

  double get custo => area * precoMetroQuadrado;

  String get dataMedidaFormatada =>
      '${medidaEm.day.toString().padLeft(2, '0')}/'
      '${medidaEm.month.toString().padLeft(2, '0')}/'
      '${medidaEm.year}';

  String ficha() =>
      '$descricao, ${largura.toStringAsFixed(2)}x${altura.toStringAsFixed(2)}m, '
      'qtd $quantidade, $material';
}
