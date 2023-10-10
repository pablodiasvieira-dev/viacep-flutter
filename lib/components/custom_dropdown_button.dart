import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key, this.value, required this.onChanged});

  final String? value;
  final Function(String?) onChanged;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  final List<String> _stateAbbreviations = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: DropdownButtonFormField<String>(
        value: widget.value,
        onChanged: widget.onChanged,
        items: _stateAbbreviations.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: const TextStyle(color: Color.fromARGB(255, 207, 207, 7)),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.white, width: 3.0),
          ),
          labelText: 'UF',
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
