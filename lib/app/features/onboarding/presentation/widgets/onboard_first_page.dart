import 'package:flutter/material.dart';

class OnboardFirstPage extends StatelessWidget {
  const OnboardFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 250,
                  child: Image.asset('assets/images/img intro 1.png'),
                ),
              ),
              SizedBox(height: 60),
              Text(
                "The World at Your Fingertips",
                style: TextStyle(
                  color: Color(0xFF575C89),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Get 24/7 updates on global news - from breaking politics to cultural trends, all in one place",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
