import 'package:flutter/material.dart';

class AddressEmpty extends StatelessWidget {
  const AddressEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 40.0,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        Text(
          'CEP Inexistente',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
