import 'package:estudos_prova/component/appbar_component.dart';
import 'package:estudos_prova/component/snack_bar_component.dart';
import 'package:estudos_prova/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _controladorUsuario = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Calculadora de IMC'),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Para começar, informe seu nome:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: _controladorUsuario,
                decoration: InputDecoration(
                  labelText: 'Nome do usuário',
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxWidth: 250.0),
                ),
                validator: (usuario) {
                  if (usuario == null || usuario.isEmpty) {
                    return 'Preencha o campo usuário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bool login = LoginController.instance.login(
                      _controladorUsuario.text,
                    );
                    if (_controladorUsuario.text.length >= 3) {
                      if (login) {
                        Navigator.of(context).pushNamed('/calculoimc');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackBar(
                            mensagem: 'Preencha o nome do usuário.',
                            corFundo: Colors.redAccent,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snackBar(
                          mensagem:
                              'Preencha o nome do usuário com pelo menos 3 caracteres.',
                          corFundo: Colors.redAccent,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
