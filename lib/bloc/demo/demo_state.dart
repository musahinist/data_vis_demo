part of 'demo_bloc.dart';

abstract class DemoState extends Equatable {
  const DemoState();

  @override
  List<Object> get props => [];
}

class DemoInitial extends DemoState {
  @override
  String toString() => 'DemoInitial';
}

class DemoPriceEntryLoadingState extends DemoState {
  @override
  String toString() => ' DemoPriceEntryLoadingState';
}

class DemoPriceEntryLoadedState extends DemoState {
  const DemoPriceEntryLoadedState({this.priceListPeriods});
  final PriceEntryPeriods priceListPeriods;
  List<Object> get props => [priceListPeriods];
  @override
  String toString() => 'DemoPriceEntryLoadedState';
}

class DemoPriceEntryErrorState extends DemoState {
  const DemoPriceEntryErrorState({this.error});
  final String error;
  @override
  List<Object> get props => [error];

  @override
  String toString() => 'DemoPriceEntryErrorState';
}
