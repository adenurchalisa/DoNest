class Donation {
  final int? id;
  final String campaignTitle; // Judul kampanye
  final int amount;          // Jumlah donasi
  final String date;         // Tanggal donasi (string untuk kemudahan)

  Donation({
    this.id,
    required this.campaignTitle,
    required this.amount,
    required this.date,
  });

  // Konversi dari Map (dari database)
  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      id: map['id'],
      campaignTitle: map['campaignTitle'],
      amount: map['amount'],
      date: map['date'],
    );
  }

  // Konversi ke Map (untuk database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'campaignTitle': campaignTitle,
      'amount': amount,
      'date': date,
    };
  }
}
