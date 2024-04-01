import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

class FileHelper {
  File? selectedFile;

  Future<void> pickFile() async {
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

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      selectedFile = File(result.files.single.path!);
      print('File yang dipilih: ${selectedFile!.path}');

      // Memanggil fungsi openFile untuk membuka file yang dipilih
      _openSelectedFile();
    } else {
      // Jika tidak ada file yang dipilih
      print('Tidak ada file yang dipilih');
    }
  }

  Future<void> _openSelectedFile() async {
    if (selectedFile != null) {
      String path = selectedFile!.path;
      await OpenFile.open(path);
    }
  }
}
