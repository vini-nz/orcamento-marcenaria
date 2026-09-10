import 'peca.dart';

class Projeto {
  Projeto({required this.cliente, required this.ambiente, List<Peca>? pecas})
    : _pecas = pecas ?? <Peca>[];

  final String cliente;
  final String ambiente;

  final List<Peca> _pecas;

  List<Peca> get pecas => List.unmodifiable(_pecas);

  int get totalPecas => _pecas.length;

  double get areaTotal =>
      _pecas.fold<double>(0.0, (soma, peca) => soma + peca.area);

  double get custoTotal =>
      _pecas.fold<double>(0.0, (soma, peca) => soma + peca.custo);

  void adicionar(Peca peca) => _pecas.add(peca);
}
