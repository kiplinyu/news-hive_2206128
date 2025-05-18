import 'package:flutter/material.dart';

class OnboardThirdPage extends StatefulWidget {
  const OnboardThirdPage({super.key});

  @override
  State<OnboardThirdPage> createState() => _OnboardThirdPageState();
}

class _OnboardThirdPageState extends State<OnboardThirdPage> {
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
                  width: 205,
                  child: Image.asset('assets/images/img intro 3.png'),
                ),
              ),
              SizedBox(height: 60),
              Divider(color: Color(0xFF575C89), thickness: 3, height: 20),
              Text(
                "Trusted Updates in Real-Time",
                style: TextStyle(
                  color: Color(0xFF575C89),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Instant alerts for breaking news. rigorously fact-chocked by our editors before they reach you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
