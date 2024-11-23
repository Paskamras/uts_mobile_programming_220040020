// lib/pages/add_country_page.dart

import 'package:flutter/material.dart';
import '../models/country.dart';

class AddCountryPage extends StatefulWidget {
  final Function(Country) onSave; // Callback untuk menyimpan data negara

  AddCountryPage({required this.onSave});

  @override
  _AddCountryPageState createState() => _AddCountryPageState();
}

class _AddCountryPageState extends State<AddCountryPage> {
  final _countryCodeController = TextEditingController();
  final _countryNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _flagUrlController = TextEditingController();

  void _addCountry() {
    final country = Country(
      countryCode: _countryCodeController.text,
      countryName: _countryNameController.text,
      description: _descriptionController.text,
      flagUrl: _flagUrlController.text, // URL gambar bendera
    );

    widget.onSave(country); // Menyimpan data negara ke halaman sebelumnya
    Navigator.pop(context); // Kembali ke halaman daftar negara
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Negara Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _countryCodeController,
              decoration: InputDecoration(labelText: 'Kode Negara'),
            ),
            TextField(
              controller: _countryNameController,
              decoration: InputDecoration(labelText: 'Nama Negara'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi Negara'),
            ),
            TextField(
              controller: _flagUrlController,
              decoration: InputDecoration(labelText: 'URL Gambar Bendera'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addCountry,
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
