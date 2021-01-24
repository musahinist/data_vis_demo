import 'package:data_visualization/data/model/price_entry.dart';
import 'package:data_visualization/data/model/price_entry_period.dart';
import 'package:data_visualization/data/provider/demo/demo_provider.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class DemoRepository {
  final DemoPorvider _demoPorvider = DemoPorvider();

  Future<PriceEntryPeriods> getPriceEntries() async {
    try {
      final response = await _demoPorvider.getPriceEntries();
      //  print(json.decode(response.data)["1G"]);
      PriceEntryPeriods list = PriceEntryPeriods.fromJson(response.data);
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
