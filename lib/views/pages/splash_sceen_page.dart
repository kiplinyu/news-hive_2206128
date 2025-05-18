import 'package:flutter/material.dart';
import 'package:news_hive/views/widgets/onboarding_screen_widget.dart';
// import 'package:news_hive/views/pages/onboard_first_page.dart';

class SplashSceenPage extends StatefulWidget {
  const SplashSceenPage({super.key});

  @override
  State<SplashSceenPage> createState() => _SplashSceenPageState();
}

class _SplashSceenPageState extends State<SplashSceenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreenWidget()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset('assets/images/logo and title.png'),
        ),
      ),
    );
  }
}
