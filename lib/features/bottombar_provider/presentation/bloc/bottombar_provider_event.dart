part of 'bottombar_provider_bloc.dart';

abstract class BottombarProviderEvent extends Equatable {
  final int index;
  const BottombarProviderEvent({@required this.index});

  @override
  List<Object> get props => [index];
}

class ChangeBottomBarIndex extends BottombarProviderEvent {
  ChangeBottomBarIndex({@required int index}) : super(index: index);
}
