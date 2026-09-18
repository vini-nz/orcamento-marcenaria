import 'package:flutter/material.dart';

import '../cores.dart';
import '../models/peca.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _larguraController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  String? _erro;

  @override
  void dispose() {
    _descricaoController.dispose();
    _larguraController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  void _confirmar() {
    final descricao = _descricaoController.text.trim();
    final largura = double.tryParse(
      _larguraController.text.replaceAll(',', '.'),
    );
    final altura = double.tryParse(_alturaController.text.replaceAll(',', '.'));

    setState(() => _erro = null);

    if (descricao.isEmpty) {
      setState(() => _erro = 'Informe a descrição da peça.');
      return;
    }
    if (largura == null || altura == null) {
      setState(() => _erro = 'Largura e altura precisam ser números.');
      return;
    }
    if (largura <= 0 || altura <= 0) {
      setState(() => _erro = 'As medidas precisam ser maiores que zero.');
      return;
    }

    final nova = Peca(
      descricao: descricao,
      largura: largura,
      altura: altura,
      quantidade: 1,
      medidaEm: DateTime.now(),
    );

    Navigator.of(context).pop(nova);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nova peça',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: marrom,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: marromClaro,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Icon(Icons.add_box_outlined, color: marromEscuro, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Preencha as medidas para adicionar uma nova peça ao projeto.',
                    style: TextStyle(color: marromEscuro, height: 1.35),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _campo(
            controlador: _descricaoController,
            rotulo: 'Descrição',
            dica: 'Ex.: Porta de armário',
            icone: Icons.edit_outlined,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _campo(
                  controlador: _larguraController,
                  rotulo: 'Largura',
                  dica: '0,80',
                  icone: Icons.swap_horiz_rounded,
                  numerico: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _campo(
                  controlador: _alturaController,
                  rotulo: 'Altura',
                  dica: '0,60',
                  icone: Icons.swap_vert_rounded,
                  numerico: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Medidas em metros',
            style: TextStyle(fontSize: 12, color: marromMedio),
          ),
          if (_erro != null)
            Container(
              margin: const EdgeInsets.only(top: 18),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red.shade900),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _erro!,
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 28),
          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: _confirmar,
              style: ElevatedButton.styleFrom(
                backgroundColor: marrom,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.check_rounded),
              label: const Text(
                'Adicionar peça',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _campo({
    required TextEditingController controlador,
    required String rotulo,
    required String dica,
    required IconData icone,
    bool numerico = false,
  }) {
    return TextFormField(
      controller: controlador,
      keyboardType: numerico
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        hintText: dica,
        prefixIcon: Icon(icone),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
