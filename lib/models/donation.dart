class Donation {
  final String campaignTitle;
  final int amount;
  final String date;
  final int? id;

  Donation({
    required this.campaignTitle,
    required this.amount,
    required this.date,
    this.id,
  });

  // Convert Donation object to Map
  Map<String, dynamic> toMap() {
    return {
      'campaignTitle': campaignTitle,
      'amount': amount,
      'date': date,
      if (id != null) 'id': id,
    };
  }

  // Create Donation object from Map
  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      id: map['id'],
      campaignTitle: map['campaignTitle'],
      amount: map['amount'],
      date: map['date'],
    );
  }

  @override
  String toString() {
    return 'Donation(id: $id, campaignTitle: $campaignTitle, amount: $amount, date: $date)';
  }
}
