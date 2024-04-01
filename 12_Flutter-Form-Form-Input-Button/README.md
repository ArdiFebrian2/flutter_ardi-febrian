Flutter From

1.From
  -Menerima isian
  -Isian data dapat lebih dari satu
  cara membuat from 
  *Menggunakan StatefulWidget
  *Keadaan form disimpan menggunakan        GlobalKey<FormState>
  Contoh:
  ```dart
  var formkey = GlobalKey<FormState>
  Form(
    key: formKey,
    child:inputWidget
  );
  ```
2,Input:
  Input digunakan untuk menerima masukan dari pengguna, seperti teks, angka, atau pilihan.
  -Beberapa jenis input yang umum digunakan adalah TextField untuk masukan teks, Checkbox untuk pilihan biner, dan DropdownButton untuk pilihan dari daftar.
  -Input biasanya diletakkan di dalam Form widget.
  Berikut Cara Membuat Form
  ```dart
  var formKey = GlobalKey<FormState>();
  Form(
    key:formKey,
    child:inputWidgets,
  );
  ```
  

3.Button:
  Button adalah elemen yang memungkinkan pengguna untuk memicu suatu tindakan ketika diklik.
  -Flutter menyediakan berbagai jenis button, seperti ElevatedButton, TextButton, dan OutlinedButton.
  -Button biasanya digunakan untuk mengirimkan data dari form atau memicu perubahan layar atau tindakan lainnya.
  -Dapat diberikan handler untuk menangani event ketika tombol ditekan, menggunakan properti seperti onPressed.
  Berikut Cara Membuat Eleved Button
  ```dart
  ElevatedButton(
    child: const Text('Submit'),
    onPressed:(){
    },
  );
  ```



