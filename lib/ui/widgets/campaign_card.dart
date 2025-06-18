import 'package:flutter/material.dart';
import '../../models/campaign.dart';
import '../../utils/format_rupiah.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaign;
  final bool isHorizontal;
  const CampaignCard({required this.campaign, this.isHorizontal = true, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigasi ke detail campaign
      },
      child: Container(
        width: isHorizontal ? 250 : double.infinity,
        height: isHorizontal ? 245 : null, // > Naikkan tinggi card!
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: isHorizontal ? EdgeInsets.only(top: 8, bottom: 8) : EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, // <-- Pakai max biar semua isi muat
          children: [
            // Gambar campaign
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.network(
                campaign.imageUrl,
                height: 90, // < Perkecil sedikit tinggi gambar
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Detail campaign
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    campaign.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${formatRupiah(campaign.raised)} terkumpul dari",
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  Text(
                    "${formatRupiah(campaign.target)} target",
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: campaign.getProgress(),
                    minHeight: 6,
                    color: Colors.blue,
                    backgroundColor: Colors.blue.withAlpha((255 * 0.2).toInt()),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.groups, size: 15, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text("${campaign.patrons} donatur", style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                      const SizedBox(width: 12),
                      Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text("${campaign.daysLeft} hari lagi", style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          campaign.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: campaign.isBookmarked ? Colors.blue : Colors.grey[400],
                          size: 22,
                        ),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}