import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  final String username;
  final int totalDonation;
  final VoidCallback? onTopUp;

  const HeaderHome({
    super.key,
    required this.username,
    required this.totalDonation,
    this.onTopUp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffc7e5ee),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris atas: foto profil, teks, notifikasi
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto profil bulat
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/avatar.png'), // Ganti dengan asset kamu
                ),
              ),
              const SizedBox(width: 16),
              // Teks
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat datang, $username 👍',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Masih banyak kebaikan yang bisa dilakukan...",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              // Notifikasi bulat
              Material(
                color: Colors.white,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.notifications_none, color: Colors.blue, size: 24),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          // Komponen saldo donasi
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.55),
              borderRadius: BorderRadius.circular(32),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                // Bulat hijau rupiah
                Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    color: Color(0xff6fcf97),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.attach_money, color: Colors.white, size: 22),
                  ),
                ),
                const SizedBox(width: 14),
                // Nominal donasi (format rupiah)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Rp${_formatRupiah(totalDonation)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                      const TextSpan(
                        text: ' total donasi',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Tombol Isi Saldo
                InkWell(
                  borderRadius: BorderRadius.circular(32),
                  onTap: onTopUp,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Row(
                      children: const [
                        Text(
                          "Isi Saldo",
                          style: TextStyle(
                            color: Color(0xff0277bd),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(Icons.arrow_forward, color: Color(0xff0277bd), size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _formatRupiah(int number) {
    String str = number.toString();
    String result = '';
    for (int i = 0; i < str.length; i++) {
      int pos = str.length - i;
      result = str[pos - 1] + result;
      if (i % 3 == 2 && i != str.length - 1) result = '.' + result;
    }
    return result;
  }
}