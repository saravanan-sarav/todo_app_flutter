import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/basic_constants.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final List<FlSpot> data = [
    FlSpot(0, 3), // Business
    FlSpot(1, 4), // Food
    FlSpot(2, 2), // Entertainment
    FlSpot(3, 5), // Details
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    foregroundImage:
                        AssetImage('assets/images/profile_image.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    Constants.username,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 30),
              child: ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard'),
                onTap: () {
                  // Handle dashboard menu item tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 30),
              child: ListTile(
                leading: Icon(Icons.insert_drive_file),
                title: const Text('Template'),
                onTap: () {
                  // Handle template menu item tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 30),
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle settings menu item tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 30),
              child: ListTile(
                leading: Icon(Icons.more_horiz),
                title: Text('Options'),
                onTap: () {
                  // Handle options menu item tap
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 30),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  // Handle options menu item tap
                },
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: ListTile(
            //     leading: Icon(Icons.exit_to_app),
            //     title: Text('Logout'),
            //     onTap: () {
            //       // Handle logout tap
            //     },
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 30, left: 30),
              child: SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 3,
                    minY: 0,
                    maxY: 10,
                    titlesData: FlTitlesData(
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Business';
                            case 1:
                              return 'Food';
                            case 2:
                              return 'Entertainment';
                            case 3:
                              return 'Details';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: false, // Don't show titles on the Y-axis
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: data,
                        isCurved: true,
                        colors: [Colors.grey],
                        barWidth: 3,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    borderData: FlBorderData(show: true),
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
