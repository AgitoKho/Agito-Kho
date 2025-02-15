import 'package:flutter/material.dart';

class WaterIntakeScreen extends StatefulWidget {
  @override
  _WaterIntakeScreenState createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> {
  final List<Map<String, dynamic>> _waterData = [];

  void _addWaterData(double liters, DateTime date) {
    setState(() {
      _waterData.add({'liters': liters, 'date': date});
    });
  }

  String _getWaterCategory(double liters) {
    if (liters < 1.5) return "Bad";
    if (liters >= 1.5 && liters <= 2.0) return "Average";
    return "Good";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Water Intake Tracker')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _addWaterData(2.0, DateTime.now());
            },
            child: Text("Add Sample Data"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _waterData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Water: ${_waterData[index]['liters']} L"),
                  subtitle: Text("Category: ${_getWaterCategory(_waterData[index]['liters'])}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}