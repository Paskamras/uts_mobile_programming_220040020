// lib/models/country.dart

class Country {
  String countryCode; // Kode Negara
  String countryName; // Nama Negara
  String description; // Deskripsi Negara
  String flagUrl; // URL atau path gambar bendera negara

  Country({
    required this.countryCode,
    required this.countryName,
    required this.description,
    required this.flagUrl,
  });

  // Convert to JSON (untuk penggunaan di dalam aplikasi atau jika dibutuhkan untuk serialisasi)
  Map<String, dynamic> toJson() {
    return {
      'countryCode': countryCode,
      'countryName': countryName,
      'description': description,
      'flagUrl': flagUrl,
    };
  }

  // Convert from JSON (berguna jika menggunakan database atau API)
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['countryCode'],
      countryName: json['countryName'],
      description: json['description'],
      flagUrl: json['flagUrl'],
    );
  }
}
