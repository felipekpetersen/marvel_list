import 'package:dio/dio.dart';
import 'package:marvel_list/core/common/constants.dart';
import 'package:marvel_list/core/network/dio_helper.dart';

import 'character_model.dart';
import 'remote_characters_datasource.dart';

class RemoteCharactersDataSourceImp implements RemoteCharactersDataSource {
  final Dio dio;

  RemoteCharactersDataSourceImp({required this.dio});

  @override
  Future<CharacterModel> getCharacters() async {
    final response = await DioHelper.getData(path: Constants.getCharacters);
    final data = response.data;
        
    return CharacterModel.fromJson(data);
  }
}
