import 'package:flutter/material.dart';

import '../models/peca.dart';
import '../models/peca_sob_medida.dart';
import '../models/projeto.dart';
import 'widgets/cartao_peca.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Projeto _projeto = Projeto(
    cliente: 'Ana Ribeiro',
    ambiente: 'Cozinha planejada',
    pecas: [
      Peca(
        descricao: 'Porta de armário',
        largura: 0.40,
        altura: 0.70,
        quantidade: 4,
        medidaEm: DateTime(2026, 8, 20),
      ),
      Peca(
        descricao: 'Prateleira',
        largura: 1.20,
        altura: 0.35,
        quantidade: 3,
        medidaEm: DateTime(2026, 8, 20),
      ),
      PecaSobMedida(
        descricao: 'Bancada da pia',
        largura: 2.40,
        altura: 0.60,
        quantidade: 1,
        medidaEm: DateTime(2026, 8, 20),
        material: 'Granito',
        precoMetroQuadrado: 780.00,
        acabamento: 'Borda reta polida',
        prazoDias: 12,
      ),
      Peca(
        descricao: 'Gaveteiro',
        largura: 0.60,
        altura: 0.80,
        quantidade: 2,
        medidaEm: DateTime(2026, 8, 21),
      ),
      Peca(
        descricao: 'Painel ripado',
        largura: 2.10,
        altura: 1.40,
        quantidade: 1,
        medidaEm: DateTime(2026, 8, 21),
        material: 'MDF 18mm ripado',
        precoMetroQuadrado: 460.00,
      ),
      PecaSobMedida(
        descricao: 'Torre quente',
        largura: 0.65,
        altura: 2.20,
        quantidade: 1,
        medidaEm: DateTime(2026, 8, 22),
        acabamento: 'Pintura fosca',
        prazoDias: 20,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        titleSpacing: 20,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _projeto.ambiente,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 2),
            Text(
              'Cliente: ${_projeto.cliente}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Adicionar Peça'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Resumo(projeto: _projeto),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 20, 8),
            child: Text(
              'Peças do projeto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 2, bottom: 90),
              itemCount: _projeto.totalPecas,
              itemBuilder: (context, indice) {
                final peca = _projeto.pecas[indice];
                return CartaoPeca(peca: peca, onTap: () {});
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Resumo extends StatelessWidget {
  const _Resumo({required this.projeto});

  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: _Metrica(
              rotulo: 'Peças',
              valor: '${projeto.totalPecas}',
              icone: Icons.grid_view_rounded,
            ),
          ),
          Expanded(
            child: _Metrica(
              rotulo: 'Área total',
              valor: '${projeto.areaTotal.toStringAsFixed(2)} m²',
              icone: Icons.square_foot_rounded,
            ),
          ),
          Expanded(
            child: _Metrica(
              rotulo: 'Custo',
              valor: 'R\$ ${projeto.custoTotal.toStringAsFixed(0)}',
              icone: Icons.attach_money_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

class _Metrica extends StatelessWidget {
  const _Metrica({
    required this.rotulo,
    required this.valor,
    required this.icone,
  });

  final String rotulo;
  final String valor;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icone, size: 20, color: Colors.brown.shade900),
        Text(
          valor,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.brown.shade900,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          rotulo,
          style: TextStyle(fontSize: 12, color: Colors.brown.shade700),
        ),
      ],
    );
  }
}
