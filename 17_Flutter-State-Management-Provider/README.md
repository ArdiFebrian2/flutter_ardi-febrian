State Management Provider
Providers adalah sebuah paket Flutter yang membantu dalam manajemen state aplikasi. Dengan menggunakan provider, Anda dapat menyediakan dan mengakses data atau fungsi yang dibutuhkan di seluruh aplikasi tanpa harus melewatkan data melalui widget-tree. Provider bekerja berdasarkan konsep "InheritedWidget", tetapi dengan sintaks yang lebih sederhana dan mudah dipahami.

Berikut Cara menggunakan provider pada Flutter:
1.Instalasi:
provider adalah paket Flutter yang digunakan untuk manajemen state. Anda perlu menambahkan dependensi ini pada file pubspec.yaml untuk dapat menggunakannya.

2.Membuat Model:
CounterModel adalah sebuah model sederhana yang memiliki satu properti count dan dua metode: increment dan decrement. Model ini merepresentasikan data counter yang akan kita kelola Contohnya:
```dart
class CounterModel {
  int count = 0;

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}
```

3.Membuat Provider:
CounterProvider adalah provider yang mengelola state untuk CounterModel.
ChangeNotifier adalah mixin yang digunakan untuk membuat provider yang bisa memberi tahu widget yang mendengarnya untuk memperbarui diri ketika terjadi perubahan pada state.
notifyListeners() digunakan untuk memberitahu semua widget yang mendengarkan provider ini untuk memperbarui tampilannya Contohnya:
```dart
class CounterProvider extends ChangeNotifier {
  CounterModel _counter = CounterModel();
  CounterModel get counter => _counter;
  void incrementCounter() {
    _counter.increment();
    notifyListeners(); 
  }
  void decrementCounter() {
    _counter.decrement();
    notifyListeners();
  }
}
```

4.Menggunakan Provider dalam Widget:
ChangeNotifierProvider digunakan untuk menyediakan CounterProvider ke seluruh widget di aplikasi.
Consumer<CounterProvider> digunakan untuk mendengarkan perubahan pada CounterProvider dan membangun UI berdasarkan state yang dikelola oleh provider tersebut.
Pada tombol ElevatedButton, Provider.of<CounterProvider>(context, listen: false) digunakan untuk mengakses metode incrementCounter dan decrementCounter dari CounterProvider dan menambahkan atau mengurangi nilai counter tanpa memperbarui UI saat tombol ditekan Contohnya:
```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Providers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(
              builder: (context, counterProvider, child) {
                return Text(
                  '${counterProvider.counter.count}',
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterProvider>(context, listen: false)
                        .incrementCounter();
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterProvider>(context, listen: false)
                        .decrementCounter();
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```