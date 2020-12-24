import 'package:get_it/get_it.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  _injectWidget();
}

void _injectWidget() {
  sl.registerFactory(() => ButtonBloc());
}
