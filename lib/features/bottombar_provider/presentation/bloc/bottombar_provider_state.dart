part of 'bottombar_provider_bloc.dart';

abstract class BottombarProviderState extends Equatable {
  final int index;
  const BottombarProviderState({@required this.index});

  @override
  List<Object> get props => [index];
}

class BottombarProviderInitial extends BottombarProviderState {}

class BottombarIndexChanged extends BottombarProviderState {
  BottombarIndexChanged({@required int index}) : super(index: index);
}
