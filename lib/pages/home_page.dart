// Todo widget possui um build, que retorna um widget responsável pela tela
// mainAxisSize: MainAxisSize.max, => tamanho que a row ou column ocupam
// mainAxisAlignment: MainAxisAlignment.center, => alinhamento no eixo principal
// crossAxisAlignment: CrossAxisAlignment.start, => alinhamento no eixo secundário
// Scaffold fornece um tipo de 'molde' para as aplicações (appBar, Drawer, etc)
// Colocar o retorno no flutter é opcional
// Size size = MediaQuery.of(context).size; tamanho da tela com base no contexto (poderá ser usado no dart web)
// height: double.infinity, => altura ocupa todo espaço
//Image.asset: busca imagem de pasta no projeto
//Image.network: busca imagem da rede
//Existem outros também
// margin: EdgeInsets.all(20), => aplicando em todas as direções margin de 20

import 'package:flutter/material.dart';
import 'package:flutter_basico/widgets/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

/* Importações de pacotes feitos por mim mesmo */
import 'package:flutter_basico/pages/hello_page2.dart';
import 'package:flutter_basico/pages/hello_page3.dart';
import 'package:flutter_basico/utils/nav.dart';
import 'package:flutter_basico/widgets/blue_button.dart';
import 'package:flutter_basico/pages/hello_listview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController( //serve para criar uma página com navegação de abas
      length: 3, //quantidade de abas que nossa tela terá
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello Flutter',
          ),
          centerTitle: true,
          bottom: TabBar( //crianda a barra de abas
            tabs: <Widget>[
              Tab( //tab é a aba em si, juntamente com seu título
                text: "TAB 1",
              ),
              Tab(
                text: "TAB 2",
              ),
              Tab(
                text: "TAB 3",
              )
            ],
          ),
        ),
        body: TabBarView( //TabBarView contém as telas ou widgets que serão exibidos ao mudar de aba
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => print('click no FAB'),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  Widget _body(context) {
    return ListView(
      children: <Widget>[
        Center(
          child: _text('Hello World'),
        ),
        _pageView(),
        _buttons(),
      ],
    );
  }

  _pageView() {
    return Container(
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _onClickNavigator(context, Widget page) async {
    String s = await push(context, page);

    print('Voltamos da tela $s');
  }

  _buttons() {
    return Builder(builder: (context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BlueButton(
                "ListView",
                onPressed: () => _onClickNavigator(context, HelloListView()),
                color: Colors.red,
              ),
              BlueButton("Page 2",
                  onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton("Page 3",
                  onPressed: () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
              BlueButton("Toast", onPressed: _onClickToast),
            ],
          ),
        ],
      );
    });
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Fala galera!'),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'OK',
        onPressed: () => print('OK'),
        textColor: Colors.white,
      ),
    ));
  }

  _onClickDialog(context) {
    showDialog(
        barrierDismissible:
            false, // faz com que o dialog não seja fechado ao clicar fora dele
        context: context,
        builder: (context) {
          return WillPopScope(
            //serve para previnir o click no botão voltar
            onWillPop: () async =>
                false, //se a pessoa clicar no botão voltar, o dialog n é fechado
            child: AlertDialog(
              title: Text('Flutter é foda!!'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text('Confirmar'),
                    onPressed: () {
                      Navigator.pop(context);
                      print('more actions here...');
                    }),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Toast no Flutter",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _img(caminho) {
    return Image.asset(
      caminho,
      fit: BoxFit.cover,
    );
  }

  _text(msg) {
    return Text(
      msg,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.wavy,
        decorationColor: Colors.red,
      ),
    );
  }
}
