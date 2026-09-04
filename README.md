# Trabalho do 1º Bimestre — Programação para Dispositivos Móveis

**Integrante:** Vinícius Barbosa dos Santos — RA 277833-2025
**Turma:** 4º ESW B — **Professor:** Me. Gustavo Meneghetti Arcolezi

## Domínio

<!-- TODO (Vinícius): escreva aqui, com suas palavras, uma frase dizendo quais
     são as duas entidades e como elas se relacionam. O README do trabalho pede
     isso explicitamente: "Declarem o tema logo no início do README.md do
     repositório, com uma frase explicando quais são as entidades e como elas se
     relacionam." -->

### Por que composição e não herança

<!-- TODO (Vinícius): o exercício 3 pede esta justificativa por escrito, em uma
     ou duas frases. Use o teste das duas frases:
       "toda peça sob medida é uma peça"  -> fecha, então é herança
       "todo projeto é uma peça"          -> não fecha, então é composição
     Escreva do seu jeito. Esta é a resposta que ele pode cobrar oralmente. -->

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

<!-- TODO: preencher arquivo e linha reais conforme os exercícios forem ficando
     prontos. Sem esta tabela o trabalho não é corrigido. -->

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

Entrega com erro de análise não é corrigida.
