import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';

void main() {
  ButtonBloc bloc;
  setUp(() {
    bloc = ButtonBloc();
  });
  test('Should return initial Button state', () {
    expect(bloc.state, ButtonInitial());
  });

  test('Should return ButtonChanged State', () {
    final tColor = Colors.white;

    final expected = [
      ButtonInitial(),
      ButtonChanged(
        backgroundColor: tColor,
        textColor: tColor,
        bottomMargin: 0,
      )
    ];
    expectLater(bloc, emitsInOrder(expected));
    bloc.add(ChangeButton(
      backgroundColor: tColor,
      textColor: tColor,
      bottomMargin: 0,
    ));
  });
  test('Should retun IndexAndTextChanged state', () async {
    final text = "text";
    final index = 0;
    final expected = [
      ButtonInitial(),
      IndexAndTextChanged(text: text, index: index)
    ];
    expectLater(bloc, emitsInOrder(expected));
    bloc.add(ChangeIndexAndText(text: text, index: index));
  });
}
