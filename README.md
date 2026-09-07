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
| 1 | Entidade principal | | Bloco `[1]` do relatório |
| 2 | Herança | | Bloco `[2]` do relatório |
| 3 | Composição | | Bloco `[3]` do relatório |
| 4 | Encapsulamento | | Bloco `[4]` e o total no topo da lista |
| 5 | Estrutura de tela | | AppBar e corpo da tela inicial |
| 6 | Cartão | | Cada item da lista |
| 7 | Lista | | Lista rolável com seis itens |
| 8 | Navegação | | Toque no item abre o detalhe |
| 9 | Formulário | | Tela de cadastro |
| 10 | Estado | | Item novo na lista e total atualizado |

## Verificação

```bash
cd parte1-dart   && dart analyze
cd parte2-flutter && flutter analyze
```