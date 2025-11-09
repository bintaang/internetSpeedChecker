import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speednetworkapp/pages/speed_test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.spaceMonoTextTheme(Theme.of(context).textTheme),
      ),
      home: const SpeedTestPage(), // HALAMAN UTAMA
    );
  }
}
