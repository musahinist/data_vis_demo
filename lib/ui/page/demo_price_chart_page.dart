import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/demo/demo_bloc.dart';
import '../../data/model/price_entry.dart';
import '../../data/model/price_entry_period.dart';
import 'demo_price_chart_data.dart';

class DemoPriceChartPage extends StatefulWidget {
  @override
  _DemoPriceChartPageState createState() => _DemoPriceChartPageState();
}

class _DemoPriceChartPageState extends State<DemoPriceChartPage> {
  DemoBloc demoBloc;
  PriceEntryPeriods priceListPeriods;
  //can be done with enum
  final List<String> periodList = ['1G', '1H', '1A', '3A', '1Y', '5Y'];
  String period;
  List<PriceEntry> priceList;
//When the button is clicked, the priceList is changed according to the appropriate state
  setPeriod() {
    switch (period) {
      case '1G':
        priceList = priceListPeriods.l1G;
        break;
      case '1H':
        priceList = priceListPeriods.l1H;
        break;
      case '1A':
        priceList = priceListPeriods.l1A;
        break;
      case '3A':
        priceList = priceListPeriods.l3A;
        break;
      case '1Y':
        priceList = priceListPeriods.l1Y;
        break;
      case '5Y':
        priceList = priceListPeriods.l5Y;
        break;
      default:
        priceList = priceListPeriods.l1G;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    demoBloc = DemoBloc()..add(DemoPriceEntryRequestEvent());
    period = periodList[0];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Demo Price Chart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 320,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.green[100]),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                      //This field can be used to display extra data.
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  width: double.maxFinite,
                  child: BlocBuilder<DemoBloc, DemoState>(
                    cubit: demoBloc,
                    builder: (context, state) {
                      //Show progress indicator if state is loading, show chart if loaded
                      if (state is DemoPriceEntryLoadedState) {
                        priceListPeriods = state.priceListPeriods;
                        setPeriod();
                        return LineChartWidget(priceEntryList: priceList);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(width: 2, color: Colors.green)),
                  ),
                  child: Row(
                    children: periodList
                        .map(
                          (e) => Expanded(
                            child: FlatButton(
                              color: period == e
                                  ? Colors.green[300]
                                  : Colors.white,
                              //change the time period when clicked and refresh the state
                              onPressed: () {
                                period = e;
                                setState(() {});
                              },
                              child: Text(
                                e,
                                style: TextStyle(
                                  color:
                                      period == e ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key key,
    @required this.priceEntryList,
  }) : super(key: key);
  final List<PriceEntry> priceEntryList;
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          minX: priceEntryList.first.d.toDouble(),
          maxX: priceEntryList.last.d.toDouble(),
          minY:
              (priceEntryList.map((e) => e.c.toDouble()).toList()).reduce(min),
          maxY:
              (priceEntryList.map((e) => e.c.toDouble()).toList()).reduce(max),
          lineBarsData: DemoPriceChartData.lineBarsData(priceEntryList),
          gridData: DemoPriceChartData.gridData,
          borderData: DemoPriceChartData.borderData,
          titlesData: DemoPriceChartData.titlesData,
          lineTouchData: DemoPriceChartData.lineTouchData),
      swapAnimationDuration: const Duration(milliseconds: 300),
    );
  }
}
