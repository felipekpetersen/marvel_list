import 'character_model.dart';

abstract class RemoteCharactersDataSource {
  Future<CharacterModel> getCharacters();
}
