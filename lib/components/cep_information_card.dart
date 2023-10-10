import 'package:flutter/material.dart';
import 'package:flutter_viacep/models/cep_model.dart';

class CepInformationCard extends StatelessWidget {
  const CepInformationCard({
    super.key,
    required this.address,
  });

  final CepModel address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          address.cep,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          address.bairro,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          address.logradouro,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          '${address.localidade} - ${address.uf}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'DDD ${address.ddd}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
