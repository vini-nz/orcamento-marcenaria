# Trabalho do 1º Bimestre — Programação para Dispositivos Móveis

**Integrante:** Vinícius Barbosa dos Santos — RA 277833-2025
**Turma:** 4º ESW B — **Professor:** Me. Gustavo Meneghetti Arcolezi

## Domínio

O sistema representa o orçamento de um projeto de marcenaria.

A entidade individual é a `Peca`: um item que será fabricado, com descrição,
largura, altura, quantidade, material, preço por metro quadrado e a data em que
foi medida. Cada peça sabe calcular a própria área e o próprio custo.

A entidade agrupadora é o `Projeto`: um ambiente contratado por um cliente, que
contém a lista de peças a serem produzidas e informa a área e o custo total do
conjunto.

`PecaSobMedida` é uma especialização de `Peca`, para itens que fogem da medida
padrão. Além dos dados de qualquer peça, guarda o acabamento e o prazo de
produção, e custa mais por exigir trabalho específico.

### Por que composição e não herança

Um projeto não é uma peça, ele tem peças: a frase "todo projeto é uma peça" não
se sustenta. Por isso `Projeto` guarda uma `List<Peca>` como atributo em vez de
herdar de `Peca`. Já "toda peça sob medida é uma peça" se sustenta, e é por isso
que `PecaSobMedida` usa `extends`.

## Como rodar

```bash
# Parte 1 — relatório no terminal
cd parte1-dart
dart run bin/main.dart

# Parte 2 — aplicativo
cd parte2-flutter
flutter run
```

> É `dart run bin/main.dart`, e não `dart run` sozinho: o executável padrão do
> pacote seria `bin/parte1_dart.dart`, e o enunciado exige `bin/main.dart`.

## Tabela de rastreio

| # | Exercício | Arquivo e linha | O que aparece na tela |
|---|---|---|---|
| 1 | Entidade principal | `parte1-dart/bin/models/peca.dart:1` | Bloco `[1]` do relatório: os dados da porta de armário |
| 2 | Herança | `parte1-dart/bin/models/peca_sob_medida.dart:3` | Bloco `[2]` do relatório: as duas fichas lado a lado |
| 3 | Composição | `parte1-dart/bin/models/projeto.dart:10` | Bloco `[3]` do relatório: o projeto e suas peças |
| 4 | Encapsulamento | `parte1-dart/bin/models/projeto.dart:12` | Bloco `[4]` do relatório e o total no topo da lista |
| 5 | Estrutura de tela | `parte2-flutter/lib/screens/home_page.dart:100` | AppBar com o ambiente e o cliente, e o corpo da tela inicial |
| 6 | Cartão | `parte2-flutter/lib/screens/widgets/cartao_peca.dart:19` | Cada peça da lista, com ícone, medidas e área |
| 7 | Lista | `parte2-flutter/lib/screens/home_page.dart:139` | Lista rolável com as seis peças do projeto |
| 8 | Navegação | `parte2-flutter/lib/screens/home_page.dart:76` | Toque no cartão abre a tela de detalhe da peça |
| 9 | Formulário | `parte2-flutter/lib/screens/cadastro_page.dart:175` | Tela de cadastro, com aviso quando algum campo está errado |
| 10 | Estado | `parte2-flutter/lib/screens/home_page.dart:92` | A peça nova entra na lista e os totais do topo mudam |

## Verificação

```bash
cd parte1-dart   && dart analyze
cd parte2-flutter && flutter analyze
```