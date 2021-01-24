import '../../model/price_entry_period.dart';
import '../../provider/demo/demo_provider.dart';

class DemoRepository {
  final DemoPorvider _demoPorvider = DemoPorvider();
//raw data mapped to data models
  Future<PriceEntryPeriods> getPriceEntries() async {
    try {
      final response = await _demoPorvider.getPriceEntries();
      PriceEntryPeriods list = PriceEntryPeriods.fromJson(response.data);
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
