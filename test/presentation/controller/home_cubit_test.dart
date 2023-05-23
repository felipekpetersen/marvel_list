import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_list/features/home/data/repository/character_repository_imp.dart';
import 'package:marvel_list/features/home/presentation/controller/cubit/home_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

class MockCharacterRepository extends Mock implements CharacterRepositoryImp {}

@GenerateMocks(<Type>[MockCharacterRepository])
void main() {
  late MockMockCharacterRepository mockRepository;

  setUp(() {
    mockRepository = MockMockCharacterRepository();
  });

  test(
      'test initial state',
      () => {
            expect(HomeCubit(characterRepository: mockRepository).state,
                equals(HomeInitial()))
          });
}
