import 'package:flutter/material.dart';

// HomeScreen, uygulamanın ana ekranını temsil eden bir widget'tır.
// Şu an için sadece görsel arayüzü (UI) içerir, butonların işlevleri daha sonra eklenecek.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold, bir ekranın temel iskeletini (üst bar, içerik alanı vb.) sağlar.
    return Scaffold(
      // AppBar, ekranın en üstündeki başlıktır.
      appBar: AppBar(
        title: Row(
          children: [
            // HTML'deki eco ikonunu buraya ekliyoruz.
            Icon(
              Icons.eco,
              color: Colors.white.withOpacity(0.9),
            ),
            const SizedBox(width: 10), // İkon ile yazı arasında boşluk
            // Uygulama adı
            const Text('NutriTürk'),
          ],
        ),
      ),
      // body, ekranın ana içerik alanıdır.
      // Padding, içeriğin ekran kenarlarından biraz içeride başlamasını sağlar.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center( // Her şeyi dikey olarak ortalamak için Center kullanıyoruz.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Öğeleri dikeyde ortala
            crossAxisAlignment: CrossAxisAlignment.stretch, // Öğeleri yatayda genişlet
            children: [
              
              // --- "Kamerayla Tara" Butonu ---
              FilledButton.icon(
                onPressed: () {
                  // TODO: Kamera tarama işlevi buraya eklenecek.
                  print("Kamera ile tara butonuna basıldı!");
                },
                icon: const Icon(Icons.camera_alt, size: 24),
                label: const Text('Kamerayla Tara'),
                style: FilledButton.styleFrom(
                  // Butonun yüksekliğini ayarlamak için padding kullanıyoruz.
                   padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                
              ),
              const SizedBox(height: 40), // Buton ile manuel giriş alanı arasında boşluk

              // --- "Veya" Ayırıcı Çizgisi ---
              const Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'VEYA',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 20), // Ayırıcı ile manuel giriş alanı arasında boşluk

              // --- Barkodu Manuel Girin Alanı ---
              const Text(
                'Barkodu Manuel Girin',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16), // Başlık ile metin kutusu arasında boşluk

              Row(
                children: [
                  // Barkod giriş metin kutusu
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number, // Kullanıcıya sayısal klavye gösterir.
                      decoration: InputDecoration(
                        hintText: 'Test için: 3017620422003',
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Metin kutusu ile arama butonu arasında boşluk

                  // Arama butonu (IconButton)
                  IconButton.filled(
                    onPressed: () {
                      // TODO: Manuel arama işlevi buraya eklenecek.
                      print("Manuel arama butonuna basıldı!");
                    },
                    icon: const Icon(Icons.search),
                    iconSize: 32,
                    padding: const EdgeInsets.all(16),
                  ),
                ],
              ),

              const SizedBox(height: 60), // En altta biraz boşluk bırakmak için

            ],
          ),
        ),
      ),
    );
  }
}
