import 'package:coding_assistant_flutter/core/constants/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../core/data/pie_chart_data.dart';

class CustomerStatesWidget extends StatelessWidget {
  const CustomerStatesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 24, top: 16),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          border: Border.all(
            color: const Color(0xFFF0EDFF),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Satisfication',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFFC7CEED),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            kHeight(24),
            SizedBox(
              height: 150,
              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 80,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 48,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle:
                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xFFC7CEED),
                          ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
