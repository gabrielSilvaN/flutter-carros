import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basico/utils/nav.dart';

import 'dog_page.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
        actions: <Widget>[
          IconButton(
            //iconButton é um ícone clicável
            icon: Icon(Icons.list),
            onPressed: () {
              // print('Lista');
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              // print('Grid');
              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    final List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png")
    ];

    //ListView.builder itera sobre o conjunto de dados escolhido e renderiza de forma dinâmica o que se deseja mostrar
    //GridView.builder faz o mesmo que o ListView.builder, porém utilizando um sistema de grid (linhas e colunas)

    if (_gridView) {
      return GridView.builder(
        itemCount: dogs.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        // itemExtent: 300, //faz com que cada item do listview tenha 300 de altura
        itemBuilder: (BuildContext context, int index) {
          return _itemView(dogs, index); //extraí toda essa parte para um método
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300, //faz com que cada item do listview tenha 300 de altura
        itemBuilder: (BuildContext context, int index) {
          return _itemView(dogs, index); //extraí toda essa parte para um método
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: () => push(context, DogPage(dog)),
      child: Stack(
        //Stack cria uma pilha de Widgets, se eu colocasse o texto antes da imagem, a imagem iria sobrescrever ele
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                dog.nome,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(caminho) {
    return Image.asset(
      caminho,
      fit: BoxFit.cover,
    );
  }
}
