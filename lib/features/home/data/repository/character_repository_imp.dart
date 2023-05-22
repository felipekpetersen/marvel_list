import 'package:marvel_list/features/home/data/data_source/remote/character_model.dart';
import 'package:marvel_list/features/home/data/data_source/remote/remote_characters_datasource.dart';
import 'package:marvel_list/features/home/data/repository/character_repository.dart';

class CharacterRepositoryImp extends CharacterRepository {

  RemoteCharactersDataSource remoteCharactersDataSource;

  CharacterRepositoryImp({required this.remoteCharactersDataSource});

  @override
  Future<CharacterModel> getCharacters(int offset) async {
    return await remoteCharactersDataSource.getCharacters(offset);
  }
}
