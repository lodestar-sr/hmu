import 'package:get_it/get_it.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/input_form/data/datasources/input_form_local_data_source.dart';
import 'package:hmu/widgets/input_form/data/repository/input_form_repository_impl.dart';
import 'package:hmu/widgets/input_form/domain/repositories/input_form_repository.dart';
import 'package:hmu/widgets/input_form/domain/usecases/get_country_codes.dart';
import 'package:hmu/widgets/input_form/presentation/bloc/input_form_bloc.dart';
import 'package:hmu/widgets/spin_number_picker/bloc/change_age_bloc.dart';

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
  sl.registerFactory(() => ChangeAgeBloc());
}
