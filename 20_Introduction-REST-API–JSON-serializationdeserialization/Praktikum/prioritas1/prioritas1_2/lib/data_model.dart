class Contact {
  final int id;
  final String name;

  final String phone;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] ?? 0, // Gunakan nilai default jika null
      name: json['name'] ?? '', // Gunakan string kosong jika null
      phone: json['phone'] ?? '',
    );
  }
}
