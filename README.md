


# Layouts Responsivos no Flutter

## Demonstração
### Vertical
<p align="center">
  <img width="460" height="300" src="/assets/to_readme/vertical.gif">
</p>

### Horizontal
<p align="center">
  <img width="460" height="300" src="/assets/to_readme/horizontal.gif">
</p>



Este projeto demonstra o uso de vários widgets do Flutter para criar layouts responsivos. Abaixo estão alguns dos principais widgets utilizados:

## ListView.builder

O `ListView.builder` é um widget que cria uma lista de itens sob demanda. Ele é eficiente para listas grandes, pois apenas os itens visíveis são renderizados.

```dart
ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
        return ListTile(
            title: Text(items[index]),
        );
    },
);
```

## MediaQuery

O `MediaQuery` fornece informações sobre o tamanho da tela, orientação e outras características do dispositivo. É útil para criar layouts adaptáveis.

```dart
var screenWidth = MediaQuery.of(context).size.width;
var screenHeight = MediaQuery.of(context).size.height;
```

## CustomScrollView e Slivers

O `CustomScrollView` permite criar layouts de rolagem personalizados usando slivers. Slivers são blocos de rolagem que podem ser combinados para criar comportamentos complexos.

```dart
CustomScrollView(
    slivers: <Widget>[
        SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverAppBar'),
            ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 100,
            ),
        ),
    ],
);
```

### SliverGrid

O `SliverGrid` permite criar uma grade de itens dentro de um `CustomScrollView`.

```dart
CustomScrollView(
    slivers: [
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                    color: Colors.blue,
                    child: Center(
                        child: Text('Item $index'),
                    ),
                ),
                childCount: 20,
            ),
        ),
    ],
);
```

### SliverToBoxAdapter

O `SliverToBoxAdapter` permite que widgets normais sejam usados dentro de um `CustomScrollView`.

```dart
CustomScrollView(
    slivers: <Widget>[
        SliverToBoxAdapter(
            child: Container(
                height: 150.0,
                color: Colors.amber,
                child: Center(
                    child: Text('SliverToBoxAdapter'),
                ),
            ),
        ),
    ],
);
```

### SliverFillRemaining

O `SliverFillRemaining` preenche o espaço restante no `CustomScrollView` com um único widget.

```dart
CustomScrollView(
    slivers: <Widget>[
        SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
                color: Colors.orange,
                child: Center(
                    child: Text('SliverFillRemaining'),
                ),
            ),
        ),
    ],
);
```

## ConstrainedBox

O `ConstrainedBox` impõe restrições de tamanho a seu filho. É útil para garantir que um widget não exceda certos limites.

```dart
ConstrainedBox(
    constraints: BoxConstraints(
        minWidth: 100,
        maxWidth: 200,
        minHeight: 50,
        maxHeight: 100,
    ),
    child: Container(
        color: Colors.blue,
    ),
);
```

## Expanded

O `Expanded` é usado dentro de um `Row`, `Column` ou `Flex` para expandir um widget e preencher o espaço disponível.

```dart
Row(
    children: <Widget>[
        Expanded(
            child: Container(
                color: Colors.red,
                height: 100,
            ),
        ),
        Container(
            color: Colors.green,
            width: 100,
            height: 100,
        ),
    ],
);
```

Esses widgets são fundamentais para criar interfaces de usuário responsivas e eficientes no Flutter.