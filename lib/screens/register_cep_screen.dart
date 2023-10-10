import 'package:flutter/material.dart';
import 'package:flutter_viacep/blocs/enum/bloc_status.dart';
import 'package:flutter_viacep/blocs/register/register_blocs_exports.dart';
import 'package:flutter_viacep/components/cep_form_field_register.dart';
import 'package:flutter_viacep/components/custom_dropdown_button.dart';
import 'package:flutter_viacep/components/custom_elevated_button.dart';
import 'package:flutter_viacep/components/text_form_field_register.dart';
import 'package:flutter_viacep/models/cep_model.dart';
import 'package:flutter_viacep/screens/home_screen.dart';
import 'package:flutter_viacep/utils/colors.dart';

class RegisterCepScreen extends StatefulWidget {
  final CepModel address;

  const RegisterCepScreen({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  State<RegisterCepScreen> createState() => _RegisterCepScreenState();
}

class _RegisterCepScreenState extends State<RegisterCepScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _cepController;
  late final TextEditingController _logradouroController;
  late final TextEditingController _complementoController;
  late final TextEditingController _bairroController;
  late final TextEditingController _localidadeController;
  late final TextEditingController _ibgeController;
  late final TextEditingController _giaController;
  late final TextEditingController _dddController;
  late final TextEditingController _siafiController;
  late String _selectedStateAbbreviations;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    final CepModel address = widget.address;

    _cepController = TextEditingController(text: address.cep);
    _logradouroController = TextEditingController(text: address.logradouro);
    _complementoController = TextEditingController(text: address.complemento);
    _bairroController = TextEditingController(text: address.bairro);
    _localidadeController = TextEditingController(text: address.localidade);
    _ibgeController = TextEditingController(text: address.ibge);
    _giaController = TextEditingController(text: address.gia);
    _dddController = TextEditingController(text: address.ddd);
    _siafiController = TextEditingController(text: address.siafi);
    _selectedStateAbbreviations = address.uf;
  }

  void _addAdress() {
    BlocProvider.of<RegisterCepBloc>(context).add(CreateCep(
        newCep: CepModel(
      cep: _cepController.text,
      logradouro: _logradouroController.text,
      complemento: _complementoController.text,
      bairro: _bairroController.text,
      localidade: _localidadeController.text,
      uf: _selectedStateAbbreviations,
      ibge: _ibgeController.text,
      gia: _giaController.text,
      ddd: _dddController.text,
      siafi: _siafiController.text,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BlocBuilder<RegisterCepBloc, RegisterCepState>(
        builder: (context, state) {
          return Stack(
            children: [
              Opacity(
                opacity: state.status == BlocStatus.loading ? 0.3 : 1.0,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Cadastro de Endereço'),
                    leading: BackButton(
                      onPressed: () => Navigator.of(context).pop(),
                      color: AppColors.primaryColor,
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(2),
                      child: Container(
                        color: AppColors.secondaryColor,
                        height: 2,
                      ),
                    ),
                    toolbarHeight: 80,
                  ),
                  body: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CepFormFieldRegister(formController: _cepController),
                          TextFormFieldRegister(
                            textFormController: _logradouroController,
                            label: 'Logradouro',
                            textInputType: TextInputType.text,
                          ),
                          TextFormFieldRegister(
                            textFormController: _complementoController,
                            label: 'Complemento',
                            textInputType: TextInputType.text,
                          ),
                          TextFormFieldRegister(
                            textFormController: _bairroController,
                            label: 'Bairro',
                            textInputType: TextInputType.text,
                          ),
                          TextFormFieldRegister(
                            textFormController: _localidadeController,
                            label: 'Localidade',
                            textInputType: TextInputType.text,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomDropdownButton(
                                  value: _selectedStateAbbreviations,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedStateAbbreviations =
                                          newValue ?? '';
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: TextFormFieldRegister(
                                  textFormController: _dddController,
                                  label: 'DDD',
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          TextFormFieldRegister(
                            textFormController: _ibgeController,
                            label: 'IBGE',
                            textInputType: TextInputType.number,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormFieldRegister(
                                  textFormController: _giaController,
                                  label: 'GIA',
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              Expanded(
                                child: TextFormFieldRegister(
                                  textFormController: _siafiController,
                                  label: 'SIAFI',
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          CustomElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  _addAdress();

                                  if (state.status == BlocStatus.success) {
                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen(initialIndex: 1,)),
                                    );
                                  } else if (state.status == BlocStatus.error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Erro ao cadastrar endereço!'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                }
                              },
                              label: 'Cadastrar Endereço'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state.status == BlocStatus.loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _cepController.dispose();
    _logradouroController.dispose();
    _complementoController.dispose();
    _bairroController.dispose();
    _localidadeController.dispose();
    _ibgeController.dispose();
    _giaController.dispose();
    _dddController.dispose();
    _siafiController.dispose();
    super.dispose();
  }
}
