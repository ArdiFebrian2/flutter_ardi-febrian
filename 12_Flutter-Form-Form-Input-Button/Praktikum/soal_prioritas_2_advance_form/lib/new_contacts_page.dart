import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

class NewContactsPage extends StatefulWidget {
  @override
  _NewContactsPageState createState() => _NewContactsPageState();
}

class _NewContactsPageState extends State<NewContactsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Color _selectedColor = Colors.white;
  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      PermissionStatus status = await Permission.storage.status;
      debugPrint("${!status.isGranted}");
      if (!status.isGranted) {
        status = await Permission.storage.request();
        if (!status.isGranted) {
          print('Izin diperlukan untuk mengakses penyimpanan');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Tambahkan aksi yang sesuai
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Contacts',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    'Pilih Tanggal',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                    'Tanggal Dipilih: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                TextButton(
                  onPressed: _selectColor,
                  child: Text(
                    'Pilih Warna',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(width: 20.0),
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: _selectedColor,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                TextButton(
                  onPressed: _pickFile,
                  child: Text(
                    'Pilih File',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(width: 20.0),
                _selectedFile != null
                    ? Text('File dipilih: ${_selectedFile!.path}')
                    : Text('Tidak ada file dipilih'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Aksi yang dilakukan saat tombol submit ditekan
                String name = _nameController.text;
                String phone = _phoneController.text;
                String formattedDate =
                    DateFormat('dd/MM/yyyy').format(_selectedDate);
                String colorHex = _selectedColor.value.toRadixString(16);
                String fileName = _selectedFile != null
                    ? _selectedFile!.path.split('/').last
                    : 'Tidak ada file dipilih';

                print('Data yang dimasukkan:');
                print('Nama: $name');
                print('Nomor Telepon: $phone');
                print('Tanggal: $formattedDate');
                print('Warna: #$colorHex');
                print('File: $fileName');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _selectColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Warna'),
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
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      if (await Permission.storage.request().isGranted) {
        _pickFile();
      } else {
        print('Izin diperlukan untuk membuka file');
      }
    } else {
      _pickFile();
    }
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });

      print('File yang dipilih: ${_selectedFile!.path}');

      // Memanggil fungsi openFile untuk membuka file yang dipilih
      _openSelectedFile();
    } else {
      // Jika tidak ada file yang dipilih
      print('Tidak ada file yang dipilih');
    }
  }

  void _openSelectedFile() async {
    if (_selectedFile != null) {
      String path = _selectedFile!.path;
      await OpenFile.open(path);
    }
  }
}
