import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;
  const BottomNavBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 22),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 16,
          borderRadius: BorderRadius.circular(28),
          shadowColor: Colors.black.withAlpha(46), // 0.18 * 255 = ~46
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(
                  icon: Icons.home,
                  label: 'Beranda',
                  active: currentIndex == 0,
                  onTap: () => onTap?.call(0),
                ),
                _navItem(
                  icon: Icons.list,
                  label: 'Daftar Donasi',
                  active: currentIndex == 1,
                  onTap: () => onTap?.call(1),
                ),
                _navItem(
                  icon: Icons.favorite_border,
                  label: 'Donasi Saya',
                  active: currentIndex == 2,
                  onTap: () => onTap?.call(2),
                ),
                _navItem(
                  icon: Icons.person_outline,
                  label: 'Akun',
                  active: currentIndex == 3,
                  onTap: () => onTap?.call(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    final color = active ? Colors.blue : Colors.grey;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 12, color: color)),
          ],
        ),
      ),
    );
  }
}