// Mocks generated by Mockito 5.4.1 from annotations
// in marvel_list/test/presentation/controller/home_cubit_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:marvel_list/features/home/data/data_source/remote/character_model.dart'
    as _i3;
import 'package:marvel_list/features/home/data/data_source/remote/remote_characters_datasource.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'home_cubit_test.dart' as _i4;

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

class _FakeRemoteCharactersDataSource_0 extends _i1.SmartFake
    implements _i2.RemoteCharactersDataSource {
  _FakeRemoteCharactersDataSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCharacterModel_1 extends _i1.SmartFake
    implements _i3.CharacterModel {
  _FakeCharacterModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockCharacterRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockCharacterRepository extends _i1.Mock
    implements _i4.MockCharacterRepository {
  MockMockCharacterRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RemoteCharactersDataSource get remoteCharactersDataSource =>
      (super.noSuchMethod(
        Invocation.getter(#remoteCharactersDataSource),
        returnValue: _FakeRemoteCharactersDataSource_0(
          this,
          Invocation.getter(#remoteCharactersDataSource),
        ),
      ) as _i2.RemoteCharactersDataSource);
  @override
  set remoteCharactersDataSource(
          _i2.RemoteCharactersDataSource? _remoteCharactersDataSource) =>
      super.noSuchMethod(
        Invocation.setter(
          #remoteCharactersDataSource,
          _remoteCharactersDataSource,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<_i3.CharacterModel> getCharacters(int? offset) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [offset],
        ),
        returnValue: _i5.Future<_i3.CharacterModel>.value(_FakeCharacterModel_1(
          this,
          Invocation.method(
            #getCharacters,
            [offset],
          ),
        )),
      ) as _i5.Future<_i3.CharacterModel>);
}
