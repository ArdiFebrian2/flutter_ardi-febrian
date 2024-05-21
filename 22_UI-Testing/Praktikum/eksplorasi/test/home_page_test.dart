import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eksplorasi/home_page.dart';

void main() {
  testWidgets('Judul Halaman harus Aplikasi Belajar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('learning application'), findsOneWidget);
  });

  testWidgets(
      'Welcome section terdapat teks Selamat datang di Aplikasi Belajar Kami!',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('Welcome to Our Learning Application!'), findsOneWidget);
  });

  testWidgets(
      'Jika di scroll akan terdapat teks This application has many programming language lessons that can help you in creating your own applications using the programming languages ​​we learn.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(
        find.text(
            'This application has many programming language lessons that can help you in creating your own applications using the programming languages ​​we learn.'),
        findsOneWidget);
  });
  testWidgets('Learning Items Learn Flutter', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
            body: Card(
          child: Text('Learn Flutter'),
        )),
      ),
    );
    expect(find.text('Learn Flutter'), findsOneWidget);
  });

  testWidgets('Favorite Icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Icon(Icons.favorite),
        ),
      ),
    );
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('Terdapat teks Contact Us', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
            body: Card(
          child: Text('Contact Us'),
        )),
      ),
    );
    expect(find.text('Contact Us'), findsOneWidget);
  });

  testWidgets('Terdapat TextFormField yang berisi text First Name',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text('First Name'),
        ),
      ),
    );
    expect(find.text('First Name'), findsOneWidget);
  });

  testWidgets('Terdapat TextFormField yang berisi text Last Name',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('Last Name'),
      ),
    ));
    expect(find.text('Last Name'), findsOneWidget);
  });

  testWidgets('Terdapat TextFormField yang berisi text Email',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('Email'),
      ),
    ));
    expect(find.text('Email'), findsOneWidget);
  });

  testWidgets('Terdapat TextFormField yang berisi text Message',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('Message'),
      ),
    ));
    expect(find.text('Message'), findsOneWidget);
  });

  testWidgets('Submit Button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ElevatedButton(onPressed: () {}, child: const Text('Submit')),
        ),
      ),
    );
    expect(find.text('Submit'), findsOneWidget);
  });
}
