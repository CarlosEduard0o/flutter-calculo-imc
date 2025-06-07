import 'package:flutter/material.dart';

AppBar appbar(String titulo) {
  return AppBar(
    leading: Icon(Icons.calculate),
    title: Text(titulo, style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.grey,
    foregroundColor: Colors.white,
  );
}
