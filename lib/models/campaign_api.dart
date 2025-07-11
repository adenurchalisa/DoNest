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
    try {
      // Konversi dari format GlobalGiving ke format yang digunakan aplikasi Anda
      return CampaignApi(
        id: json['id'] ?? 0,
        title: json['title'] ?? 'Untitled Campaign',
        description: json['need'] ?? json['summary'] ?? 'No description available',
        imageUrl: json['imageLink'] ?? 'https://via.placeholder.com/400x200?text=No+Image',
        target: _parseIntValue(json['goal']) ?? 10000000,
        terkumpul: _parseIntValue(json['funding']) ?? 0,
        donatur: _parseIntValue(json['numberOfDonations']) ?? 0,
        // Hitung sisa hari dari tanggal akhir jika tersedia, atau gunakan nilai default
        sisaHari: 30, // nilai default, sesuaikan dengan data API
        penyelenggara: json['organization']?['name'] ?? 'Unknown Organization',
        kontak: json['organization']?['contactAddress'] ?? 'No contact information',
      );
    } catch (e) {
      print("Error parsing JSON to CampaignApi: $e");
      // Return a default campaign if parsing fails
      return CampaignApi(
        id: 0,
        title: 'Error Loading Campaign',
        description: 'Could not load campaign details',
        imageUrl: 'https://via.placeholder.com/400x200?text=Error',
        target: 10000000,
        terkumpul: 0,
        donatur: 0,
        sisaHari: 30,
        penyelenggara: 'Unknown',
        kontak: 'N/A',
      );
    }
  }
  
  // Helper method to parse int values safely
  static int? _parseIntValue(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      try {
        return int.parse(value);
      } catch (_) {
        try {
          return double.parse(value).toInt();
        } catch (_) {
          return null;
        }
      }
    }
    return null;
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