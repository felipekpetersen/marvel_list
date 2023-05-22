import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data_source/remote/character_model.dart';
import '../../../data/repository/character_repository_imp.dart';
import '../../../domain/entity/character.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CharacterRepositoryImp characterRepository;

  HomeCubit({required this.characterRepository}) : super(HomeInitial());

  Future<void> getCharacters() async {
    emit(HomeLoading());
    final charactersModel = await characterRepository.getCharacters();
    final List<Character> characters = List<Character>.from(
        (charactersModel.data!.results as List));
    emit(HomeLoaded(characters: characters));
  }
}
