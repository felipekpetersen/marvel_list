import 'package:marvel_list/features/home/data/data_source/remote/character_model.dart';

abstract class CharacterRepository {
  Future<CharacterModel> getCharacters();
}
