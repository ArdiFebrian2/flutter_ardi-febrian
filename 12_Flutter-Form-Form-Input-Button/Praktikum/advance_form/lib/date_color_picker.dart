import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: MyDatePickerPage(),
  ));
}

class MyDatePickerPage extends StatefulWidget {
  @override
  _MyDatePickerPageState createState() => _MyDatePickerPageState();
}

class _MyDatePickerPageState extends State<MyDatePickerPage> {
  DateTime _selectedDate = DateTime.now();
  Color _selectedColor = Colors.blue;
  File? _selectedFile; // Nullable File

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _selectColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      // User didn't pick a file
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date & Color Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Color Picker:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Center(
              child: GestureDetector(
                onTap: _selectColor,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: _selectedColor,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: _selectColor,
                child: Text('Pick Color'),
              ),
            ),
            SizedBox(height: 20.0),
            if (_selectedFile != null)
              Text('File dipilih: ${_selectedFile!.path}'),
          ],
        ),
      ),
    );
  }
}
