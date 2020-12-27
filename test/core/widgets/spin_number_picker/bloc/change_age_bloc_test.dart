import 'package:flutter_test/flutter_test.dart';
import 'package:hmu/widgets/spin_number_picker/bloc/change_age_bloc.dart';

void main() {
  ChangeAgeBloc bloc;
  setUp(() {
    bloc = ChangeAgeBloc();
  });

  test('Should return age changed state', () {
    int age = 20;
    final expected = [ChangeAgeInitial(), AgeChanged(age)];
    expectLater(bloc, emitsInOrder(expected));
    bloc.add(ChangeAge(age));
  });
}
