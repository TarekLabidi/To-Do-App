import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:to_do_list_app/utils/palette.dart';

class WeeklyWidget extends StatelessWidget {
  const WeeklyWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20)
                .copyWith(bottom: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Weekly goal',
                      style: TextStyle(
                          color: Palette.greyColor,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Text(
                      '4/30 tasks',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.007,
                    ),
                    const Text(
                      'Keep Up the momentum!',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.007,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Edit Goal',
                        style: TextStyle(
                            color: Palette.purpleColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 5.0,
                  percent: 0.60,
                  center: Image.asset('assets/images/trophy.png'),
                  progressColor: Palette.purpleColor,
                  reverse: true,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Weelky Streak',
                  style: TextStyle(
                    color: Palette.greyColor,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const Text(
                  '0 weeks',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Completed in the last 4 weeks',
                  style: TextStyle(
                    color: Palette.greyColor,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      enableAxisAnimation: false,
                      margin: const EdgeInsets.only(top: 20),
                      primaryXAxis: const CategoryAxis(),
                      primaryYAxis: const NumericAxis(
                        isVisible: false,
                      ),
                      series: <CartesianSeries<_ChartData, String>>[
                        BarSeries<_ChartData, String>(
                            width: 0.4,
                            dataSource: [
                              _ChartData('4', 1),
                              _ChartData('3', 0),
                              _ChartData('2', 7),
                              _ChartData('1', 2),
                            ],
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            name: 'Gold',
                            color: Palette.purpleColor)
                      ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
