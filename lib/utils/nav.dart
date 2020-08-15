import 'package:flutter/material.dart';

Future push(context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}

//fazer aqui depois o do pop
