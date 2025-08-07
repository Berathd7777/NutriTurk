import 'package:flutter/material.dart';
import 'package:nutriturk/home_screen.dart'; // Henüz oluşturmadık ama birazdan ekleyeceğiz.

void main() {
  runApp(const NutriTurkApp());
}

class NutriTurkApp extends StatelessWidget {
  const NutriTurkApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Uygulamanın genel temasını ve tasarımını burada belirliyoruz.
    // HTML projesindeki yeşil rengi ve Material Design'ı temel alıyoruz.
    return MaterialApp(
      title: 'NutriTürk',
      debugShowCheckedModeBanner: false, // Sağ üstteki 'DEBUG' etiketini kaldırır.
      theme: ThemeData(
        // Ana renk paletini tanımlıyoruz.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00796B), // Bu bizim ana yeşil rengimiz.
          primary: const Color(0xFF00796B),
          background: const Color(0xFFF5F5F5), // Arka plan rengi
        ),
        
        // Uygulama genelinde kullanılacak yazı tipleri ve stiller.
        fontFamily: 'Roboto', // Google'ın standart fontu, Material hissi verir.

        // Uygulamanın üst bar (AppBar) temasını ayarlıyoruz.
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00796B), // AppBar arkaplanı
          foregroundColor: Colors.white, // AppBar üzerindeki yazı ve ikon rengi
          elevation: 4.0, // Hafif bir gölge
        ),

        // Butonların genel temasını ayarlıyoruz.
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF00796B), // Buton rengi
            foregroundColor: Colors.white, // Buton üzerindeki yazı rengi
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Kartların genel görünümü
        cardTheme: CardTheme(
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),

        useMaterial3: true, // Modern Material Design 3'ü etkinleştirir.
      ),
      home: const HomeScreen(), // Uygulama açıldığında gösterilecek ilk ekran.
    );
  }
}
