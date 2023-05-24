import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_list/features/home/data/data_source/remote/character_model.dart';
import 'package:meta/meta.dart';
import '../../../data/repository/character_repository_imp.dart';
import '../../../domain/entity/character.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CharacterRepositoryImp characterRepository;

  HomeCubit({
    required this.characterRepository,
  }) : super(HomeInitial());

  static const int _horizontalCount = 5;
  int _heroCount = 0;
  bool _loadingHeroes = false;

  Future<void> getCharacters() async {
    emit(HomeLoading());
    final charactersModel = await characterRepository.getCharacters(0);
    final List<Character> characters =
        List<Character>.from((charactersModel.data!.results as List));

    final List<Character> verticalCharacters = List.from(
        characters.getRange(_horizontalCount, characters.length).toList());

    final List<Character> horizontalCharacters =
        List.from(characters.getRange(0, _horizontalCount).toList());

    _heroCount = horizontalCharacters.length + verticalCharacters.length;

    emit(HomeLoaded(
        verticalCharacters: verticalCharacters,
        horizontalCharacters: horizontalCharacters));
  }

  Future<void> getMoreCharacters() async {
    final currentState = state;
    if (currentState is HomeLoaded && !_loadingHeroes) {
      _loadingHeroes = true;
      
      final charactersModel =
          await characterRepository.getCharacters(_heroCount);
      final List<Character> characters =
          List<Character>.from((charactersModel.data!.results as List));
      _heroCount += characters.length;
      _loadingHeroes = false;

      List<Character> verticalCharacters =
          List.from(currentState.verticalCharacters);
      verticalCharacters.addAll(characters);
      
      emit(HomeLoaded(
          verticalCharacters: verticalCharacters,
          horizontalCharacters: currentState.horizontalCharacters));
    }
  }
}
