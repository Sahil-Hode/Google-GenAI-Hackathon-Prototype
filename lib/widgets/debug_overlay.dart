import 'package:flutter/material.dart';

class DebugOverlay extends StatelessWidget {
  const DebugOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final width = size.width.round();
    final height = size.height.round();

    String deviceType;
    if (width >= 1100) {
      deviceType = 'Desktop';
    } else if (width >= 650) {
      deviceType = 'Tablet';
    } else {
      deviceType = 'Mobile';
    }

    return Positioned(
      bottom: 10,
      right: 10,
      child: IgnorePointer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black.withAlpha((255 * 0.7).round()),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '$width x $height ($deviceType)',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
