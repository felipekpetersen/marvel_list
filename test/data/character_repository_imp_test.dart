import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_list/features/home/data/data_source/remote/character_model.dart';
import 'package:marvel_list/features/home/data/data_source/remote/remote_characters_datasource.dart';
import 'package:marvel_list/features/home/data/repository/character_repository_imp.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_repository_imp_test.mocks.dart';

class MockCharacterDataSource extends Mock
    implements RemoteCharactersDataSource {}

@GenerateMocks(<Type>[MockCharacterDataSource])
void main() {
  late MockMockCharacterDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockMockCharacterDataSource();
  });

  test('get character model', () async {
    var model = CharacterModel();

    when(mockDataSource.getCharacters(1)).thenAnswer((_) async => model);
    final repository = CharacterRepositoryImp(
        remoteCharactersDataSource: mockDataSource);
    repository.getCharacters(1).then((value) {
      expect(value, isA<CharacterModel>());
    });
  });
}
