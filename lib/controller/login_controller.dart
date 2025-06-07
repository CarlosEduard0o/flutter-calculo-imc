import 'package:estudos_prova/model/usuario.dart';

class LoginController {
  static final LoginController instance = LoginController();

  final Usuario _usuario = Usuario();

  void setNomeUsuario(String nomeUsuario) {
    _usuario.setNomeUsuario(nomeUsuario);
  }

  bool login(String usuario) {
    if (usuario == null || usuario.isEmpty) {
      return false;
    } else {
      setNomeUsuario(usuario);
      return true;
    }
  }

  String? get usuario => _usuario.getNomeUsuario();
}
