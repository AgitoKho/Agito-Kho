import 'package:flutter/material.dart';

class StepsTrackerScreen extends StatefulWidget {
  @override
  _StepsTrackerScreenState createState() => _StepsTrackerScreenState();
}

class _StepsTrackerScreenState extends State<StepsTrackerScreen> {
  final List<Map<String, dynamic>> _stepsData = [];

  void _addStepData(int steps, DateTime date) {
    setState(() {
      _stepsData.add({'steps': steps, 'date': date});
    });
  }

  String _getStepCategory(int steps) {
    if (steps < 4000) return "Bad";
    if (steps >= 4000 && steps <= 8000) return "Average";
    return "Good";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Steps Tracker')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _addStepData(5000, DateTime.now());
            },
            child: Text("Add Sample Data"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _stepsData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Steps: ${_stepsData[index]['steps']}"),
                  subtitle: Text("Category: ${_getStepCategory(_stepsData[index]['steps'])}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}