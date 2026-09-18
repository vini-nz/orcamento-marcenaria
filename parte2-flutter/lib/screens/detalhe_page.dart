import 'package:flutter/material.dart';

import '../cores.dart';
import '../models/peca.dart';
import '../models/peca_sob_medida.dart';

class DetalhePage extends StatelessWidget {
  final Peca peca;

  const DetalhePage({super.key, required this.peca});

  @override
  Widget build(BuildContext context) {
    final sobMedida = peca is PecaSobMedida ? peca as PecaSobMedida : null;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhe da peça',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: marrom,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: marromClaro,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    sobMedida != null
                        ? Icons.straighten_rounded
                        : Icons.crop_square_rounded,
                    size: 28,
                    color: sobMedida != null ? marromEscuro : marromMedio,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        peca.descricao,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sobMedida != null ? 'Peça sob medida' : 'Peça padrão',
                        style: TextStyle(
                          color: sobMedida != null ? marromEscuro : marromMedio,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          _SecaoTitulo(texto: 'Medidas e quantidade'),
          _Linha(
            rotulo: 'Dimensões',
            valor:
                '${peca.largura.toStringAsFixed(2)} × '
                '${peca.altura.toStringAsFixed(2)} m',
          ),
          _Linha(rotulo: 'Quantidade', valor: '${peca.quantidade}'),
          _Linha(
            rotulo: 'Área total',
            valor: '${peca.area.toStringAsFixed(2)} m²',
          ),
          const SizedBox(height: 18),
          _SecaoTitulo(texto: 'Valores e material'),
          _Linha(rotulo: 'Material', valor: peca.material),
          _Linha(
            rotulo: 'Preço por m²',
            valor: 'R\$ ${peca.precoMetroQuadrado.toStringAsFixed(2)}',
          ),
          _Linha(
            rotulo: 'Custo da peça',
            valor: 'R\$ ${peca.custo.toStringAsFixed(2)}',
            destaque: true,
          ),
          _Linha(rotulo: 'Medida em', valor: peca.dataMedidaFormatada),
          if (sobMedida != null)
            Column(
              children: [
                const SizedBox(height: 18),
                _SecaoTitulo(texto: 'Informações extras'),
                _Linha(rotulo: 'Acabamento', valor: sobMedida.acabamento),
                _Linha(rotulo: 'Prazo', valor: '${sobMedida.prazoDias} dias'),
              ],
            ),
        ],
      ),
    );
  }
}

class _SecaoTitulo extends StatelessWidget {
  const _SecaoTitulo({required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _Linha extends StatelessWidget {
  const _Linha({
    required this.rotulo,
    required this.valor,
    this.destaque = false,
  });

  final String rotulo;
  final String valor;
  final bool destaque;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              rotulo,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ),
          const SizedBox(width: 18),
          Flexible(
            child: Text(
              valor,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 14,
                fontWeight: destaque ? FontWeight.w800 : FontWeight.w600,
                color: destaque ? marrom : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
