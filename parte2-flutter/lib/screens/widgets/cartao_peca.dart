import 'package:flutter/material.dart';

import '../../cores.dart';
import '../../models/peca.dart';
import '../../models/peca_sob_medida.dart';

class CartaoPeca extends StatelessWidget {
  const CartaoPeca({super.key, required this.peca, required this.onTap});

  final Peca peca;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final sobMedida = peca is PecaSobMedida;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: marromClaro,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                sobMedida ? Icons.straighten : Icons.crop_square,
                color: marromEscuro,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${peca.largura.toStringAsFixed(2)} x ${peca.altura.toStringAsFixed(2)} m · qtd ${peca.quantidade}',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),

            Text(
              '${peca.area.toStringAsFixed(2)} m²',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: marrom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
