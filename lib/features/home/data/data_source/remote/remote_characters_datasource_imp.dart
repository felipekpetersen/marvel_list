import 'package:dio/dio.dart';
import 'package:marvel_list/core/common/constants.dart';
import 'package:marvel_list/core/network/dio_helper.dart';

import 'character_model.dart';
import 'remote_characters_datasource.dart';

class RemoteCharactersDataSourceImp implements RemoteCharactersDataSource {

  @override
  Future<CharacterModel> getCharacters(int offset) async {
    final query = {
      'apikey': Constants.publicApiKey,
      'ts': Constants.ts,
      'hash': Constants.hash,
      'offset': offset
    };
    final response = await DioHelper.getData(path: Constants.getCharacters, query: query);
    final data = response.data;

    return CharacterModel.fromJson(data);
  }
}
