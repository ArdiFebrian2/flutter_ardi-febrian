Dialog Bottom Sheet

Dialog Bottom Sheet merupakan salah satu jenis dialog yang muncul dari bagian bawah layar dalam aplikasi manajemen tugas. Ini digunakan untuk menampilkan informasi tambahan, meminta konfirmasi, atau menampilkan opsi kepada pengguna tanpa menghalangi seluruh layar.

1.Penggunaan dalam Aplikasi Task Management:
Dalam aplikasi manajemen tugas, Dialog Bottom Sheet dapat digunakan untuk menampilkan detail tugas tambahan, mengonfirmasi penghapusan tugas, atau menawarkan opsi tambahan seperti pengaturan tugas atau penjadwalan ulang.
Contohnya:
```dart
void _showTaskDetailsBottomSheet(BuildContext context, String taskName) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Detail Task: $taskName',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text('Task details go here...'),
        ],
      ),
    ),
  );
}
```

2.Alert Dialog 
Merupakan komponen penting dalam aplikasi manajemen tugas. Alert Dialog digunakan untuk memberikan pemberitahuan atau konfirmasi penting kepada pengguna, seperti pemberitahuan tentang tugas yang akan segera berakhir atau permintaan konfirmasi sebelum menghapus tugas.\
Contohnya:
```dart
void _showDeleteTaskAlertDialog(BuildContext context, String taskName) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Delete Task'),
      content: Text('Are you sure you want to delete the task "$taskName"?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Delete task logic here
            Navigator.pop(context);
          },
          child: Text('Delete'),
        ),
      ],
    ),
  );
}
```

3.Button Sheet
Digunakan dalam aplikasi manajemen tugas untuk menampilkan opsi tindakan tambahan. Ini biasanya muncul setelah pengguna melakukan tindakan tertentu pada suatu tugas, seperti menekan lama pada item tugas untuk membuka menu konteks dengan opsi tambahan seperti edit atau hapus.
Contohnya:
```dart
void _showTaskOptionsButtonSheet(BuildContext context, String taskName) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Wrap(
      children: <Widget>[
        ListTile(
          title: Text('Edit Task'),
          onTap: () {
            // Navigate to edit task screen
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Delete Task'),
          onTap: () => _showDeleteTaskAlertDialog(context, taskName),
        ),
      ],
    ),
  );
}
```