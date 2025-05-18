import 'package:flutter/material.dart';

class OnboardSecondPage extends StatelessWidget {
  const OnboardSecondPage({super.key});

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
                  child: Image.asset('assets/images/img intro 2.png'),
                ),
              ),
              SizedBox(height: 130),
              Divider(color: Color(0xFF575C89), thickness: 3, height: 20),
              Text(
                "Tailored to Your Curiosity",
                style: TextStyle(
                  color: Color(0xFF575C89),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Select your interests and receive handpicked stories. Technology. sports, or entertainment — we've got you covered",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
