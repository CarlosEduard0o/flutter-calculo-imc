import 'package:flutter/material.dart';

SnackBar snackBar({String mensagem = '', Color? corFundo}) {
  return SnackBar(content: Text(mensagem), backgroundColor: corFundo);
}
