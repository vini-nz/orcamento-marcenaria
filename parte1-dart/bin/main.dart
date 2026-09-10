import 'models/peca.dart';
import 'models/peca_sob_medida.dart';
import 'models/projeto.dart';

void main() {
  final medicao = DateTime(2026, 09, 18);

  print('===== [1] ENTIDADE PRINCIPAL =====');

  final porta = Peca(
    descricao: 'Porta do Armario',
    largura: 0.40,
    altura: 0.70,
    quantidade: 4,
    medidaEm: medicao,
  );

  print(
    'Peça: ${porta.descricao} | '
    '${porta.largura.toStringAsFixed(2)}x${porta.altura.toStringAsFixed(2)}m | '
    'qtd ${porta.quantidade} | '
    '${porta.material} | '
    'medida em ${porta.dataMedidaFormatada}',
  );

  print('\n===== [2] HERANÇA =====');

  final prateleira = Peca(
    descricao: 'Prateleira',
    largura: 1.20,
    altura: 0.35,
    quantidade: 3,
    medidaEm: medicao,
  );

  final bancada = PecaSobMedida(
    descricao: 'Bancada da pia',
    largura: 2.40,
    altura: 0.60,
    quantidade: 1,
    medidaEm: medicao,
    material: 'Granito',
    precoMetroQuadrado: 780.00,
    acabamento: 'Borda reta polida',
    prazoDias: 12,
  );

  print('Peca            => ficha: "${prateleira.ficha()}"');
  print('Peca sob medida => ficha: "${bancada.ficha()}"');

  print('\n===== [3] COMPOSIÇÃO =====');

  final projeto = Projeto(
    cliente: 'Vinicius',
    ambiente: 'Guarda Roupa planejada',
    pecas: [prateleira, bancada, porta],
  );

  print(
    'Projeto: "${projeto.ambiente}" (${projeto.cliente}) '
    'contém ${projeto.totalPecas} peças: ',
  );

  for (final peca in projeto.pecas) {
    print(' - ${peca.descricao}');
  }

  print('\n===== [4] ENCAPSULAMENTO =====');

  print(
    'Projeto "${projeto.ambiente}" -> área total (calculada): '
    '${projeto.areaTotal.toStringAsFixed(2)} m² | '
    'custo: R\$ ${projeto.custoTotal.toStringAsFixed(2)}',
  );

  projeto.adicionar(
    Peca(
      descricao: 'Rodapé',
      largura: 3.00,
      altura: 0.10,
      quantidade: 2,
      medidaEm: medicao,
    ),
  );

  Peca ultimaPeca = projeto.pecas.last;

  print(
    'Após adicionar "${ultimaPeca.descricao}" (${ultimaPeca.area.toStringAsFixed(2)} m²) -> '
    '${projeto.areaTotal.toStringAsFixed(2)} m² | '
    'custo: R\$ ${projeto.custoTotal.toStringAsFixed(2)}',
  );
}
