class Campaign {
  final String title;
  final String imageUrl;
  final String raised;
  final String target;
  final int patrons;
  final int daysLeft;
  final bool isBookmarked;

  Campaign({
    required this.title,
    required this.imageUrl,
    required this.raised,
    required this.target,
    required this.patrons,
    required this.daysLeft,
    this.isBookmarked = false,
  });

  double getProgress() {
    try {
      final raisedNum = double.parse(raised.replaceAll(RegExp(r'[^\d.]'), ''));
      final targetNum = double.parse(target.replaceAll(RegExp(r'[^\d.]'), ''));
      if (targetNum == 0) return 0;
      return (raisedNum / targetNum).clamp(0.0, 1.0);
    } catch (_) {
      return 0.0;
    }
  }
}