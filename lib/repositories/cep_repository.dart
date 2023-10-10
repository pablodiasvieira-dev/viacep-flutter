import 'package:dio/dio.dart';
import 'package:flutter_viacep/models/cep_model.dart';

class CepRepository {
  final Dio dio;

  CepRepository({required this.dio});

  static const String _baseUrlBack4app =
      'https://parseapi.back4app.com/classes/ceps';

  Future<CepModel> fetchCepViaCep({required String cep}) async {
    try {
      Response response = await dio.get('https://viacep.com.br/ws/$cep/json');
      final data = response.data;

      return CepModel.fromMap(data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('${e.response?.statusCode}');
      } else {
        throw Exception('${e.message}');
      }
    }
  }

  Future<bool> checkCepBack4app({required cepToFind}) async {
    try {
      Response response =
          await dio.get('$_baseUrlBack4app?where={"cep":"$cepToFind"}');
      final data = response.data['results'] as List<dynamic>;

      return data.isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CepModel>> fetchAllCeps() async {
    try {
      Response response = await dio.get(_baseUrlBack4app);

      final data = response.data['results'] as List<dynamic>;
      final List<CepModel> ceps = data
          .map((item) => CepModel.fromMap(item as Map<String, dynamic>))
          .toList();

      return ceps;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addCep(CepModel newCep) async {
    try {
      await dio.post(
        _baseUrlBack4app,
        data: newCep.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCep(String objectId) async {
    try {
      await dio.delete('$_baseUrlBack4app/$objectId');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCep(CepModel updatedCep) async {
    try {
      await dio.put(
        '$_baseUrlBack4app/${updatedCep.objectId}',
        data: updatedCep.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
