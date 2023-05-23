// Mocks generated by Mockito 5.4.1 from annotations
// in marvel_list/test/data/character_repository_imp_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:marvel_list/features/home/data/data_source/remote/character_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'character_repository_imp_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCharacterModel_0 extends _i1.SmartFake
    implements _i2.CharacterModel {
  _FakeCharacterModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockCharacterDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockCharacterDataSource extends _i1.Mock
    implements _i3.MockCharacterDataSource {
  MockMockCharacterDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CharacterModel> getCharacters(int? offset) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [offset],
        ),
        returnValue: _i4.Future<_i2.CharacterModel>.value(_FakeCharacterModel_0(
          this,
          Invocation.method(
            #getCharacters,
            [offset],
          ),
        )),
      ) as _i4.Future<_i2.CharacterModel>);
}