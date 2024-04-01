Advance Form Input

1.Data Picker
    -Interactive Widgets
        *Interaksi Antara Aplikasi Dan User
        *Mengumpulkan input dan feedback dari user
    -Menambahkan Layout
        *Layout untuk menyusun Interactive Widgets
    -Cara Membuat Date Picker
        *Menggunakan fungsi bawaan flutter   
        showDatePicker
        *Fungsi showDatePicker memiliki tipe data future
        *Menampilkan dialog material design date picker
        contoh:
   ```dart
   final selectDate = await showDatePicker(
    context: context,
    initialDate: currentDate
    firstDate: DateTime(1990),
    lastDate: DateTime(currentDate.year + 5),
   );
   ```

2.Color Picker
    -Widget dimana user bisa memilih color
    -Penggunaaan color picker bisa digunakan berbagai macam kondisi
  Cara Membuat Color Picker
  -Membangun UI
  -Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog
  Contoh:
  ```dart
  onPressed:(){
    showDialog(
        context:context,
        builder:(context){
            return AlertDialog(
                title: const Text('Pick Your Color'),
                actions:[
                    TextButton(
                        onPressed:(){
                            Navigator.pop(context);
                        },
                        child: const Text('Submit') 
                    ),
                ],
            );
        },
    );
  },
  ```
     -import 'package:flutter_colorpicker/flutter_colorpicker.dart';
     -Membuat Kode untuk Penggunaan package flutter_colorpicker
     contoh:
   ```dart
   return AlertDialog(
    title: const Text('Pick Color'),
    content: BlockPicker(
        pickerColor:_currentColor,
        onColorChanged:(color){
            setState((){
                _currentColor = color;

            });
        },
    )
   )
   ```

3.File Picker 
    -Cara membuat File Picker
        *Menggunakan package file_picker dan open_file
        *Menambahkan packages file_picker di pubspec.yml
        *import package file_picker dan open_file
        *Membangun UI
        *Membuat Fungsi untuk mengexplore dan memilih files dari storage 
   ```dart
   void _pickFile() async {
    final result = await FilePicker.platfrom.pickFiles();
    if (result == null)return;
   }
   ```
        *Memanggil fungsi _pickFile di dalam onPressed
   ```dart
   Center(
    child: ElevatedButton(
        child: const Text('Pick and Open File'),
        onPressed:(){
            _pickFile();
        },
    ),
   ),
   ```
        *Membuat fungsi untuk membuka files yang telah dipilih
   ```dart
   void _openFile(Platformfile file){
    OpenFile.open(file.path);
   }
   ```
        *Mengambil file dari object result dan memanggil fungsi _openFile di dalam fungsi _pickFile
   ```dart
   void _pickFile()async{
    final result = await FilePicker.platform.pickFiles();
    if (result == null)return;

    final file = result.files.first;
    _openFile(file);
   }
 


    
