class CampaignApi {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final int target;
  final int terkumpul;
  final int donatur;
  final int sisaHari;
  final String penyelenggara;
  final String kontak;

  CampaignApi({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.target,
    required this.terkumpul,
    required this.donatur,
    required this.sisaHari,
    required this.penyelenggara,
    required this.kontak,
  });

  factory CampaignApi.fromJson(Map<String, dynamic> json) {
    // Konversi dari format GlobalGiving ke format yang digunakan aplikasi Anda
    return CampaignApi(
      id: json['id'],
      title: json['title'],
      description: json['need'] ?? json['summary'],
      imageUrl: json['imageLink'],
      target: json['goal'],
      terkumpul: json['funding'],
      donatur: json['numberOfDonations'],
      // Hitung sisa hari dari tanggal akhir jika tersedia, atau gunakan nilai default
      sisaHari: 30, // nilai default, sesuaikan dengan data API
      penyelenggara: json['organization']['name'],
      kontak: json['organization']['contactAddress'] ?? '',
    );
  }

  // Konversi ke Map untuk digunakan di aplikasi
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'deskripsi': description,
      'imageUrl': imageUrl,
      'target': target,
      'terkumpul': terkumpul,
      'donatur': donatur,
      'sisaHari': sisaHari,
      'penyelenggara': penyelenggara,
      'kontak': kontak,
    };
  }
}