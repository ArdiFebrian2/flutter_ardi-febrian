// Kelas Course
class Course {
  String judul;
  String deskripsi;

  // Konstruktor untuk Course
  Course(this.judul, this.deskripsi);
}

// Kelas Student
class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  // Konstruktor untuk Student
  Student(this.nama, this.kelas);

  // Method untuk menambahkan course ke daftarCourse
  void tambahCourse(Course course) {
    daftarCourse.add(course);
    print('Course ${course.judul} ditambahkan ke dalam daftar.');
  }

  // Method untuk menghapus course dari daftarCourse
  void hapusCourse(Course course) {
    daftarCourse.remove(course);
    print('Course ${course.judul} dihapus dari daftar.');
  }

  // Method untuk menampilkan semua course yang dimiliki
  void lihatDaftarCourse() {
    if (daftarCourse.isEmpty) {
      print('Daftar course kosong.');
    } else {
      print('Daftar course:');
      daftarCourse.forEach((course) {
        print('- ${course.judul}: ${course.deskripsi}');
      });
    }
  }
}

void main() {
  // Membuat instance dari kelas Student
  var student = Student('John', 'XII-A');

  // Membuat beberapa course
  var course1 = Course('Matematika', 'Pelajaran tentang matematika');
  var course2 = Course('Bahasa Inggris', 'Pelajaran tentang bahasa Inggris');

  // Menambahkan course ke daftar course student
  student.tambahCourse(course1);
  student.tambahCourse(course2);

  // Melihat daftar course yang dimiliki student
  student.lihatDaftarCourse();

  // Menghapus course dari daftar course student
  student.hapusCourse(course1);

  // Melihat daftar course yang dimiliki setelah menghapus course
  student.lihatDaftarCourse();
}
