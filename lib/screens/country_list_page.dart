// lib/pages/country_list_page.dart

import 'package:flutter/material.dart';
import '../models/country.dart';
import 'add_country_page.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  List<Country> countries = []; // Daftar negara yang disimpan dalam memori

  void _addCountry(Country country) {
    setState(() {
      countries.add(country); // Menambah data negara ke dalam list
    });
  }

  void _editCountry(int index, Country updatedCountry) {
    setState(() {
      countries[index] =
          updatedCountry; // Memperbarui data negara yang sudah ada
    });
  }

  void _deleteCountry(int index) {
    setState(() {
      countries.removeAt(index); // Menghapus data negara berdasarkan index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Negara')),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return ListTile(
            title: Text(country.countryName),
            subtitle: Text(country.description),
            leading: Image.network(country.flagUrl, width: 50, height: 50),
            onTap: () {
              // Menambahkan aksi untuk navigasi ke halaman edit jika diperlukan
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Navigasi ke halaman edit jika diperlukan
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () =>
                      _deleteCountry(index), // Menghapus data negara
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCountryPage(onSave: _addCountry),
            ),
          );
        },
      ),
    );
  }
}
