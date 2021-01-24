part of 'demo_bloc.dart';

abstract class DemoEvent extends Equatable {
  const DemoEvent();

  @override
  List<Object> get props => [];
}

class DemoPriceEntryRequestEvent extends DemoEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DemoPriceEntryRequestEvent';
}
