import 'package:estudos_prova/model/resultados.dart';
import 'package:estudos_prova/model/usuario.dart';

class IMCController {
  static final IMCController instance = IMCController();

  final Resultado _resultado = Resultado();

  final Usuario _usuario = Usuario();

  void setPesoUsuario(double pesoUsuario) {
    _usuario.setPesoUsuario(pesoUsuario);
  }

  void setAlturaUsuario(double alturaUsuario) {
    _usuario.setAlturaUsuario(alturaUsuario);
  }

  void calcularIMC(double peso, double altura) {
    double imc = peso / (altura * altura);
    _resultado.setResultadoCalculoImc(imc);

    if (imc < 18.5) {
      _resultado.setResultadoFaixaImc('Abaixo do peso');
    } else if (imc <= 24.9) {
      _resultado.setResultadoFaixaImc('Peso ideal');
    } else {
      _resultado.setResultadoFaixaImc('Acima do peso');
    }
  }

  void limpar() {
    _resultado.setResultadoCalculoImc(null);
    _resultado.setResultadoFaixaImc(null);
  }

  double? get peso => _usuario.getPesoUsuario();

  double? get altura => _usuario.getAlturaUsuario();

  double? get resultadoImc => _resultado.getResultadoCalculoImc();

  String? get resultadoFaixa => _resultado.getResultadoFaixaImc();
}
