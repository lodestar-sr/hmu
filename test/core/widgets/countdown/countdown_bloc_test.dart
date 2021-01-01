import 'package:flutter_test/flutter_test.dart';
import 'package:hmu/widgets/count_down/bloc/count_down_bloc.dart';

void main() {
  CountDownBloc bloc;
  setUp(() {
    bloc = CountDownBloc();
  });
  test('should return countdownstarted state', () {
    final expected = [CountDownInitial(), CountDownStarted()];
    expectLater(bloc, emitsInOrder(expected));
    bloc.add(StartCountDown());
  });
  test('should return countDownChanged state', () {
    int second = 60;
    final expected = [CountDownInitial(), CountDownChanged(seconds: second)];
    expectLater(bloc, emitsInOrder(expected));
    bloc.add(ChangeCountDown(seconds: second));
  });
}
