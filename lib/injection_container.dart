import 'package:get_it/get_it.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/input_form.dart/data/datasources/input_form_local_data_source.dart';
import 'package:hmu/widgets/input_form.dart/data/repository/input_form_repository_impl.dart';
import 'package:hmu/widgets/input_form.dart/domain/repositories/input_form_repository.dart';
import 'package:hmu/widgets/input_form.dart/domain/usecases/get_country_codes.dart';
import 'package:hmu/widgets/input_form.dart/presentation/bloc/input_form_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  _injectWidget();
}

void _injectWidget() {
  sl.registerFactory(() => ButtonBloc());
  sl.registerFactory(() => InputFormBloc(getCountryCodes: sl()));
  sl.registerLazySingleton(() => GetCountryCodes(repository: sl()));
  sl.registerLazySingleton<InputFormRepository>(
      () => InputFormRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<InputFormLocalDataSource>(
      () => InputFormLocalDataSourceImpl());
}
