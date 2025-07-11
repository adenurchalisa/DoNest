import 'package:flutter/material.dart';
import '../../models/donation.dart';
import '../../helpers/database_helper.dart';

class QrisPage extends StatelessWidget {
  final Map<String, dynamic> campaign;
  final int amount;
  
  const QrisPage({
    super.key, 
    required this.campaign,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    // Format tanggal sekarang (simple format)
    final now = DateTime.now();
    final dateStr = "${now.day}-${now.month}-${now.year}";
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran QRIS'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Informasi donasi
              Text(
                'Donasi untuk: ${campaign['title']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 10),
              
              Text(
                'Nominal: Rp $amount',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              
              const SizedBox(height: 30),
              
              // QRIS Image (simple placeholder or QR code generator)
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://quickchart.io/qr?text=DONASI_${Uri.encodeComponent(campaign["title"])}_${amount.toString()}&size=200',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.qr_code_2,
                          size: 150,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Instruksi pembayaran
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Cara Pembayaran:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text('1. Buka aplikasi e-wallet/m-banking'),
                    Text('2. Scan QRIS di atas'),
                    Text('3. Masukkan nominal dan konfirmasi'),
                    Text('4. Selesaikan pembayaran'),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Tombol konfirmasi
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      // Simpan donasi ke database lokal
                      final donation = Donation(
                        campaignTitle: campaign['title'],
                        amount: amount,
                        date: dateStr,
                      );
                      
                      await DatabaseHelper.instance.saveDonation(donation);
                      
                      // Periksa apakah widget masih terpasang
                      if (context.mounted) {
                        // Tampilkan dialog sukses
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Donasi Berhasil'),
                            content: Text(
                              'Terima kasih telah berdonasi sebesar Rp $amount untuk ${campaign['title']}.'
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // tutup dialog
                                  Navigator.of(context).pop(); // kembali ke detail
                                  Navigator.of(context).pop(); // kembali ke home
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    } catch (e) {
                      // Tampilkan dialog error
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Terjadi Kesalahan'),
                            content: Text('Error: $e'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Saya Sudah Bayar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
