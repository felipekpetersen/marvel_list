import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/remote/remote_characters_datasource.dart';
import '../../features/home/data/data_source/remote/remote_characters_datasource_imp.dart';
import '../../features/home/data/repository/character_repository_imp.dart';
import '../../features/home/presentation/controller/cubit/home_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    final Dio dio = Dio();
    getIt.registerLazySingleton<Dio>(() => dio);

    // Data Source 
    getIt.registerLazySingleton<RemoteCharactersDataSource>(() => RemoteCharactersDataSourceImp(dio: getIt.get()));

    //Repository
    getIt.registerLazySingleton<CharacterRepositoryImp>(() => CharacterRepositoryImp(remoteCharactersDataSource: getIt.get()));

    // BLoC
    getIt.registerFactory<HomeCubit>(() => HomeCubit(characterRepository: getIt.get()));
  }
}