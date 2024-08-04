import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_animation/generic_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Lottie.asset(
        'assets/json/main_page.json',
        controller: _animationController,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
        onLoaded: (composition) {
          _animationController.duration = composition.duration;
          _playSegment();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          label: index == 2 ? 'Start' : 'Next',
          onPressed: _playSegment,
        ),
      ),
    );
  }

  void _playSegment() {
    if (!_animationController.isAnimating) {
      _animationController.forward();
      if (index != 2) {
        Timer(Duration(milliseconds: index == 0 ? 1600 : 2200), () {
          _animationController.stop();
          setState(() {
            index++;
          });
        });
      } else {
        // Do something like Navigate to next screen
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
