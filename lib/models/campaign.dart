class Campaign {
  final String imageUrl;
  final String title;
  final int terkumpul;
  final int target;
  final int donatur;
  final int sisaHari;
  final String deskripsi;
  final String penyelenggara;
  final String kontak;

  Campaign({
    required this.imageUrl,
    required this.title,
    required this.terkumpul,
    required this.target,
    required this.donatur,
    required this.sisaHari,
    required this.deskripsi,
    required this.penyelenggara,
    required this.kontak,
  });

  // Convert Map to Campaign object
  factory Campaign.fromMap(Map<String, dynamic> map) {
    return Campaign(
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      terkumpul: map['terkumpul'] ?? 0,
      target: map['target'] ?? 0,
      donatur: map['donatur'] ?? 0,
      sisaHari: map['sisaHari'] ?? 0,
      deskripsi: map['deskripsi'] ?? '',
      penyelenggara: map['penyelenggara'] ?? '',
      kontak: map['kontak'] ?? '',
    );
  }

  // Convert Campaign object to Map
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'terkumpul': terkumpul,
      'target': target,
      'donatur': donatur,
      'sisaHari': sisaHari,
      'deskripsi': deskripsi,
      'penyelenggara': penyelenggara,
      'kontak': kontak,
    };
  }

  @override
  String toString() {
    return 'Campaign(title: $title, terkumpul: $terkumpul, target: $target)';
  }
}
