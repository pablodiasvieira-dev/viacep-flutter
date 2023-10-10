import 'package:equatable/equatable.dart';
import 'package:flutter_viacep/blocs/search/search_cep_blocs_exports.dart';
import 'package:flutter_viacep/models/cep_model.dart';
import 'package:flutter_viacep/blocs/enum/bloc_status.dart';
import 'package:flutter_viacep/repositories/cep_repository.dart';

part 'search_cep_event.dart';
part 'search_cep_state.dart';

class SearchCepBloc extends Bloc<SearchCepEvent, SearchCepState> {
  SearchCepBloc({required this.repository})
      : super(const SearchCepState(status: BlocStatus.initial)) {
    on<GetCep>(_onGetCep);
  }

  final CepRepository repository;

  void _onGetCep(GetCep event, Emitter<SearchCepState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    try {
      final CepModel address = await repository.fetchCepViaCep(cep: event.cep);

      if (isEmptyAddress(address)) {
        emit(state.copyWith(
          status: BlocStatus.success,
          isRegistered: true,
        ));
      } else {
        emit(state.copyWith(
          status: BlocStatus.success,
          address: address,
          isRegistered: false,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
          status: BlocStatus.error,
          errorMessage: 'Erro de Carregamento do ViaCEP'));
    }
  }

  bool isEmptyAddress(CepModel address) {
    return address.bairro.isEmpty || address.cep.isEmpty;
  }
}
