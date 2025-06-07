class Usuario {
  static final Usuario instance = Usuario();

  String? nome;
  double? peso;
  double? altura;

  void setNomeUsuario(String? usuario) {
    this.nome = usuario;
  }

  String? getNomeUsuario() {
    return nome;
  }

  void setPesoUsuario(double? peso) {
    this.peso = peso;
  }

  double? getPesoUsuario() {
    return peso;
  }

  void setAlturaUsuario(double? altura) {
    this.altura = altura;
  }

  double? getAlturaUsuario() {
    return altura;
  }
}
