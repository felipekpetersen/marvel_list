import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_list/core/di/dependency_controller.dart';
import 'package:marvel_list/core/network/dio_helper.dart';
import 'package:marvel_list/features/home/data/data_source/remote/character_model.dart';
import 'package:marvel_list/features/home/data/data_source/remote/remote_characters_datasource_imp.dart';
import 'package:marvel_list/features/home/data/repository/character_repository.dart';
import 'package:marvel_list/features/home/data/repository/character_repository_imp.dart';
import 'package:marvel_list/features/home/domain/entity/character.dart';
import 'package:marvel_list/features/home/presentation/controller/cubit/home_cubit.dart';
import 'package:marvel_list/features/home/presentation/home_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';


class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class MockCharacterRepository extends Mock implements CharacterRepositoryImp {}

class MockHomeState extends Fake implements HomeState {}

@GenerateMocks(<Type>[MockCharacterRepository])
void main() {
  group('HomePage', () {
    late CharacterModel model;
    late final HomeCubit homeCubit;
    late final MockCharacterRepository mockRepository;
    List<Character> verticalCharacters = [];
    List<Character> horizontalCharacters = [];
    setUpAll(() {
      model = CharacterModel(
          data: Data(results: [
        Results(id: 1, name: 'teste1'),
        Results(id: 2, name: 'teste1'),
        Results(id: 3, name: 'teste1'),
        Results(id: 4, name: 'teste1'),
        Results(id: 5, name: 'teste1'),
        Results(id: 6, name: 'teste1'),
        Results(id: 7, name: 'teste1')
      ]));
      final List<Character> characters =
          List<Character>.from((model.data!.results as List));

      verticalCharacters = characters.getRange(5, characters.length).toList();

      horizontalCharacters = characters.getRange(0, 5).toList();

      registerFallbackValue(MockHomeState());

      mockRepository = MockCharacterRepository();
      homeCubit = HomeCubit(characterRepository: mockRepository);

      when(() => mockRepository.getCharacters(0))
          .thenAnswer((_) async => model);
    });

    Widget parentWidget = MaterialApp(
      home: BlocProvider(
        create: (_) => homeCubit,
        child: const HomePage(),
      ),
    );

    testWidgets('test homepage', (widgetTester) async {
      await widgetTester.pumpWidget(parentWidget);
      expect(
          homeCubit.state,
          HomeLoaded(
              verticalCharacters: verticalCharacters,
              horizontalCharacters: horizontalCharacters));
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
