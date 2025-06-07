import 'package:estudos_prova/component/appbar_component.dart';
import 'package:estudos_prova/controller/calculo_imc_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculoIMCView extends StatefulWidget {
  const CalculoIMCView({super.key});

  @override
  State<CalculoIMCView> createState() => _CalculoIMCViewState();
}

class _CalculoIMCViewState extends State<CalculoIMCView> {
  final _formKey = GlobalKey<FormState>();
  final _controladorPeso = TextEditingController();
  final _controladorAltura = TextEditingController();

  @override
  void initState() {
    super.initState();
    IMCController.instance.limpar();
  }

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
                'Informe os dados, exemplo: 2,75',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: _controladorPeso,
                decoration: InputDecoration(
                  labelText: 'Peso(kg)',
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxWidth: 250.0),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\,?\d*')),
                ],
                validator: (peso) {
                  if (peso == null || peso.isEmpty) {
                    return 'Preencha o campo peso';
                  }
                  final valor = double.tryParse(peso.replaceAll(',', '.'));
                  if (valor == null) {
                    return 'Digite um número válido';
                  }
                  if (valor <= 0) {
                    return 'A altura deve ser maior que zero';
                  }
                  IMCController.instance.setPesoUsuario(valor);
                  return null;
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: _controladorAltura,
                decoration: InputDecoration(
                  labelText: 'Altura(metros)',
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxWidth: 250.0),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\,?\d*')),
                ],
                validator: (altura) {
                  if (altura == null || altura.isEmpty) {
                    return 'Preencha o campo altura';
                  }
                  final valor = double.tryParse(altura.replaceAll(',', '.'));
                  if (valor == null) {
                    return 'Digite um número válido';
                  }
                  if (valor <= 0) {
                    return 'A altura deve ser maior que zero';
                  }
                  IMCController.instance.setAlturaUsuario(valor);
                  return null;
                },
              ),
              SizedBox(height: 30.0),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final altura = double.tryParse(
                      _controladorAltura.text.replaceAll(',', '.'),
                    );
                    final peso = double.tryParse(
                      _controladorPeso.text.replaceAll(',', '.'),
                    );

                    setState(() {
                      IMCController.instance.calcularIMC(
                        IMCController.instance.peso!,
                        IMCController.instance.altura!,
                      );
                    });
                  }
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text('Calcular'),
              ),

              SizedBox(height: 30.0),
              IMCController.instance.resultadoImc != null &&
                      IMCController.instance.resultadoFaixa != null
                  ? Column(
                      children: [
                        Text(
                          'IMC: ${IMCController.instance.resultadoImc!.toStringAsFixed(2)}',
                        ),
                        Text(
                          'Resultado: ${IMCController.instance.resultadoFaixa}',
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
