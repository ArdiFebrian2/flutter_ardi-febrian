import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'file_helper.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
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
  FileHelper _fileHelper = FileHelper();
  String? _fileName;
  List<String> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Create New Contacts',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Please fill in the following details to create a new contact.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                prefixIcon: Icon(Icons.person),
              ),
              textCapitalization: TextCapitalization
                  .words, // Mengubah input menjadi huruf besar di awal kata
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    'Select Date',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                    'Selected Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                TextButton(
                  onPressed: _selectColor,
                  child: Text(
                    'Select Color',
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
                    'Select File',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(width: 20.0),
                _fileName != null
                    ? Text('File selected: $_fileName')
                    : Text('No file selected'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // text color
                elevation: 3, // shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // rounded corners
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // button padding
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18), // text style
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Contacts List:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.blue),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          _contacts[index],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          _editContact(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _contacts.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
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
          title: Text('Select Color'),
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
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  void _handleSubmit() {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
    String colorHex = _selectedColor.value.toRadixString(16);
    String fileName = _fileName ?? 'No file selected';

    String contactInfo =
        'Name: $name\nPhone Number: $phone\nDate: $formattedDate\nColor: #$colorHex\nFile: $fileName';

    setState(() {
      _contacts.add(contactInfo);
    });

    print('Data entered:');
    print('Name: $name');
    print('Phone Number: $phone');
    print('Date: $formattedDate');
    print('Color: #$colorHex');
    print('File: $fileName');

    // Open the selected file
    if (_fileName != null) {
      _openFile();
    }

    // Clear input fields
    _nameController.clear();
    _phoneController.clear();
    setState(() {
      _selectedDate = DateTime.now();
      _selectedColor = Colors.blue;
      _fileName = null;
    });
  }

  Future<void> _openFile() async {
    await OpenFile.open(_fileHelper.selectedFile!.path);
  }

  void _editContact(int index) {
    String contactInfo = _contacts[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Contact'),
          content: TextFormField(
            initialValue: contactInfo,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
