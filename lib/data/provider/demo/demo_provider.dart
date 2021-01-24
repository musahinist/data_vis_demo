import 'package:dio/dio.dart';

import '../abstract_provider.dart';

class DemoPorvider extends AbstractProvider {
  DemoPorvider({
    this.path = '',
    this.tag = 'DemoProvider',
  }) : super(path, tag);

  final String path;
  final String tag;
//Data was fetched from remote server with get request
  Future<Response> getPriceEntries() async {
    try {
      final response = await get(innerPath: 'demo');
      return response;
    } catch (e) {
      throw e;
    }
  }
}
