import 'dart:convert';

import 'package:meta/meta.dart';

//price entry data model
class PriceEntry {
  num d;
  num c;
  PriceEntry({
    @required this.d,
    @required this.c,
  });

  PriceEntry copyWith({
    num d,
    num c,
  }) {
    return PriceEntry(
      d: d ?? this.d,
      c: c ?? this.c,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'd': d,
      'c': c,
    };
  }

  factory PriceEntry.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PriceEntry(
      d: map['d'] as num,
      c: map['c'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceEntry.fromJson(String source) =>
      PriceEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PriceEntry(d: $d, c: $c)';
}
