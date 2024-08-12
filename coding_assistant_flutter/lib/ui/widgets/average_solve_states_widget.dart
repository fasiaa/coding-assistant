import 'package:coding_assistant_flutter/core/constants/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AverageSolveWidget extends StatelessWidget {
  const AverageSolveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 24, top: 16),
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
              'Avg. Time to Solved An Issue',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFFC7CEED),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            kHeight(24),
            const SizedBox(
              height: 200,
              child: BarChartSample8(),
            )
          ],
        ),
      ),
    );
  }
}

class BarChartSample8 extends StatefulWidget {
  const BarChartSample8({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample8> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: BarChart(
              randomData(),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
            endIndent: 80,
            indent: 80,
          ),
          kHeight(12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ReusableRow(
                title: 'Less than 1 hour',
                color: Color(0xFFBB9AF7),
              ),
              ReusableRow(
                title: '1-3 hours',
                color: Color(0xFF7AA2F7),
              ),
              ReusableRow(
                title: 'More than 3 hours',
                color: Color(0xFF9ECE6A),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
  ) {
    Color barColor;

    // Assuming x = 0 for "Less than 1 hour", x = 1 for "1-3 hours", and x = 2 for "More than 3 hours"
    switch (x) {
      case 0:
        barColor = const Color(0xFFBB9AF7); // Color for "Less than 1 hour"
        break;
      case 1:
        barColor = const Color(0xFF7AA2F7); // Color for "1-3 hours"
        break;
      case 2:
        barColor = const Color(0xFF9ECE6A); // Color for "More than 3 hours"
        break;
      default:
        barColor = Colors.grey; // Default color, in case x is not 0, 1, or 2
    }
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          borderRadius: BorderRadius.zero,
          borderDashArray: x >= 4 ? [4, 4] : null,
          width: 32,
        ),
      ],
    );
  }

  BarChartData randomData() {
    List<double> barHeights = [180, 120, 50];
    return BarChartData(
      maxY: 200.0,
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 30,
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(
        3,
        (i) => makeGroupData(
          i,
          barHeights[i], // Use the fixed bar heights
        ),
      ),
      gridData: const FlGridData(
        show: false,
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final Color color;
  const ReusableRow({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        kWidth(8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: const Color(0xFFC7CEED),
              ),
        ),
      ],
    );
  }
}
