import 'package:flutter/material.dart';

class VolumeCalculatorScreen extends StatefulWidget {
  @override
  _VolumeCalculatorScreenState createState() => _VolumeCalculatorScreenState();
}

class _VolumeCalculatorScreenState extends State<VolumeCalculatorScreen> {
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double? _volume;

  void _calculateVolume() {
    final double? length = double.tryParse(lengthController.text);
    final double? width = double.tryParse(widthController.text);
    final double? height = double.tryParse(heightController.text);

    if (length != null && width != null && height != null) {
      setState(() {
        _volume = length * width * height;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan panjang, lebar, dan tinggi yang valid')),
      );
    }
  }

  void _resetFields() {
    lengthController.clear();
    widthController.clear();
    heightController.clear();
    setState(() {
      _volume = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hitung Volume Balok', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            TextField(
              controller: lengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Panjang'),
            ),
            TextField(
              controller: widthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lebar'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateVolume,
              child: Text('Hitung'),
            ),
            TextButton(
              onPressed: _resetFields,
              child: Text('Reset'),
            ),
            SizedBox(height: 20),
            if (_volume != null)
              Text('Volume: $_volume', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
