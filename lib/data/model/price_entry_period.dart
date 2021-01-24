import 'dart:convert';

import 'package:meta/meta.dart';

import 'price_entry.dart';

//period data model
class PriceEntryPeriods {
  List<PriceEntry> l1G;
  List<PriceEntry> l1H;
  List<PriceEntry> l1A;
  List<PriceEntry> l3A;
  List<PriceEntry> l1Y;
  List<PriceEntry> l5Y;

  PriceEntryPeriods({
    @required this.l1G,
    @required this.l1H,
    @required this.l1A,
    @required this.l3A,
    @required this.l1Y,
    @required this.l5Y,
  });

  PriceEntryPeriods copyWith({
    List<PriceEntry> l1G,
    List<PriceEntry> l1H,
    List<PriceEntry> l1A,
    List<PriceEntry> l3A,
    List<PriceEntry> l1Y,
    List<PriceEntry> l5Y,
  }) {
    return PriceEntryPeriods(
      l1G: l1G ?? this.l1G,
      l1H: l1H ?? this.l1H,
      l1A: l1A ?? this.l1A,
      l3A: l3A ?? this.l3A,
      l1Y: l1Y ?? this.l1Y,
      l5Y: l5Y ?? this.l5Y,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'l1G': l1G?.map((x) => x?.toMap())?.toList(),
      'l1H': l1H?.map((x) => x?.toMap())?.toList(),
      'l1A': l1A?.map((x) => x?.toMap())?.toList(),
      'l3A': l3A?.map((x) => x?.toMap())?.toList(),
      'l1Y': l1Y?.map((x) => x?.toMap())?.toList(),
      'l5Y': l5Y?.map((x) => x?.toMap())?.toList(),
    };
  }

//All period data are mapped to the price entry data model
  factory PriceEntryPeriods.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PriceEntryPeriods(
      l1G: List<PriceEntry>.from(map['1G']?.map((x) => PriceEntry.fromMap(x))),
      l1H: List<PriceEntry>.from(map['1H']?.map((x) => PriceEntry.fromMap(x))),
      l1A: List<PriceEntry>.from(map['1A']?.map((x) => PriceEntry.fromMap(x))),
      l3A: List<PriceEntry>.from(map['3A']?.map((x) => PriceEntry.fromMap(x))),
      l1Y: List<PriceEntry>.from(map['1Y']?.map((x) => PriceEntry.fromMap(x))),
      l5Y: List<PriceEntry>.from(map['5Y']?.map((x) => PriceEntry.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceEntryPeriods.fromJson(String source) =>
      PriceEntryPeriods.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PriceEntryPeriods(l1G: $l1G, l1H: $l1H, l1A: $l1A, l3A: $l3A, l1Y: $l1Y, l5Y: $l5Y)';
  }
}
