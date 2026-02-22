import 'package:flutter_starter/features/home/data/datasources/sentence_local_datasource.dart';
import 'package:flutter_starter/features/home/data/repositories/sentence_repository_impl.dart';
import 'package:flutter_starter/features/home/domain/repositories/sentence_repository.dart';
import 'package:flutter_starter/features/home/domain/usecases/get_sentence_of_day_usecase.dart';
import 'package:flutter_starter/features/home/domain/usecases/toggle_like_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt instanceGetIt = GetIt.instance;

void setupGetIt() {
  instanceGetIt
    ..registerLazySingleton<SentenceLocalDatasource>(
      SentenceLocalDatasource.new,
    )
    ..registerLazySingleton<SentenceRepository>(
      () => SentenceRepositoryImpl(instanceGetIt.get()),
    )
    ..registerFactory<GetSentenceOfDayUseCase>(
      () => GetSentenceOfDayUseCase(instanceGetIt.get()),
    )
    ..registerFactory<ToggleLikeUseCase>(
      () => ToggleLikeUseCase(instanceGetIt.get()),
    );
}
