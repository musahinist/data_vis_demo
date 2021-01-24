import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_visualization/data/model/price_entry.dart';
import 'package:data_visualization/data/model/price_entry_period.dart';
import 'package:data_visualization/data/repository/demo/demo_repository.dart';
import 'package:data_visualization/util/http/http_exception.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'demo_event.dart';
part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoInitial());
  final DemoRepository demoRepostory = DemoRepository();
  @override
  Stream<DemoState> mapEventToState(
    DemoEvent event,
  ) async* {
    if (event is DemoPriceEntryRequestEvent) {
      try {
        yield DemoPriceEntryLoadingState();
        final _priceListPeriods = await demoRepostory.getPriceEntries();

        yield DemoPriceEntryLoadedState(priceListPeriods: _priceListPeriods);
      } catch (e) {
        yield DemoPriceEntryErrorState(error: HttpException.handleError(e));
      }
    }
  }
}
