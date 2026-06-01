import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:picsum_gallery/features/gallery/presentation/pages/gallary_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();

    _floatingController = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);

    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    _fadeController.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, _, _) => const GallaryPage(),
          transitionsBuilder: (_, animation, _, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.network('https://picsum.photos/1080/1920', fit: BoxFit.cover)),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black26, Colors.black54],
                ),
              ),
            ),
          ),

          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Iconsax.image5, color: Colors.white, size: 72),

                SizedBox(height: 16),

                Text(
                  'Picsum Gallery',
                  style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8),

                Text('Discover stunning photography', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),

          const Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(child: CircularProgressIndicator(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
