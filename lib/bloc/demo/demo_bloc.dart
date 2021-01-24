import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/price_entry_period.dart';
import '../../data/repository/demo/demo_repository.dart';
import '../../util/http/http_exception.dart';

part 'demo_event.dart';
part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoInitial());
  final DemoRepository demoRepostory = DemoRepository();
  @override
  Stream<DemoState> mapEventToState(
    DemoEvent event,
  ) async* {
    //When the data request is pushed, the data is taken and sent as ui state
    if (event is DemoPriceEntryRequestEvent) {
      try {
        yield DemoPriceEntryLoadingState();
        final _priceListPeriods = await demoRepostory.getPriceEntries();

        yield DemoPriceEntryLoadedState(priceListPeriods: _priceListPeriods);
      } catch (e) {
        yield DemoPriceEntryErrorState(
            error: HttpException.handleError(Exception(e)));
      }
    }
  }
}
