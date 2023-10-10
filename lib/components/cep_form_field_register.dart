import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CepFormFieldRegister extends StatelessWidget {
  const CepFormFieldRegister({
    super.key,
    required TextEditingController formController,
  }) : _cepController = formController;

  final TextEditingController _cepController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: TextFormField(
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        controller: _cepController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'CEP',
        ),
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '#####-###',
            filter: {"#": RegExp(r'[0-9]')},
          ),
        ],
        validator: (value) {
          if (value == null || value.isEmpty || value.length != 9) {
            return 'Formato de CEP inválido';
          }
          return null;
        },
      ),
    );
  }
}
