import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'ui/pages/home_page.dart';

void main() async {
  // Pastikan plugin diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi SQLite
  // Di web kita tidak perlu menggunakan FFI
  if (!kIsWeb()) {
    // Inisialisasi sqflite_common_ffi
    sqfliteFfiInit();
    // Tetapkan factory SQLite
    databaseFactory = databaseFactoryFfi;
  }
  
  runApp(const DonationApp());
}

// Fungsi untuk mendeteksi apakah aplikasi berjalan di web
bool kIsWeb() {
  try {
    return identical(0, 0.0);
  } catch (_) {
    return false;
  }
}

class DonationApp extends StatelessWidget {
  const DonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}