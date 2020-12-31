import 'package:flutter_test/flutter_test.dart';
import 'package:hmu/features/bottombar_provider/presentation/bloc/bottombar_provider_bloc.dart';

void main() {
  BottombarProviderBloc bloc;
  setUp(() {
    bloc = BottombarProviderBloc();
  });
  test('should return bottombarIndexChanged State ', () async {
    final index = 0;
    final expected = [
      BottombarProviderInitial(),
      BottombarIndexChanged(index: index)
    ];
    expectLater(bloc, emitsInOrder(expected));
    bloc.add(ChangeBottomBarIndex(index: index));
  });
}
