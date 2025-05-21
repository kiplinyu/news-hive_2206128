import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_hive/app/features/onboarding/presentation/pages/onboard_first_page.dart';
import 'package:news_hive/app/features/onboarding/presentation/pages/onboard_second_page.dart';
import 'package:news_hive/app/features/onboarding/presentation/pages/onboard_third_page.dart';
import 'package:news_hive/app/router/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenWidget extends StatefulWidget {
  const OnboardingScreenWidget({super.key});

  @override
  State<OnboardingScreenWidget> createState() => _OnboardingScreenWidgetState();
}

class _OnboardingScreenWidgetState extends State<OnboardingScreenWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              OnboardFirstPage(),
              OnboardSecondPage(),
              OnboardThirdPage(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 40,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,

                  effect: ExpandingDotsEffect(
                    dotColor: Color(0xFFA9B5DF),
                    activeDotColor: Color(0xFF575C89),
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_currentPage < 2)
                      Expanded(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Color(0xFFA9B5DF),
                            foregroundColor: Color(0xFF575C89),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // Adjust the value for desired roundness
                            ),
                          ),
                          onPressed: () => context.go(Routes.login),
                          child: Text(
                            'Skip',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    if (_currentPage < 2)
                      Expanded(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Color(0xFF575C89),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // Adjust the value for desired roundness
                            ),
                          ),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text('Next'),
                        ),
                      ),
                    if (_currentPage == 2)
                      Expanded(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Color(0xFF575C89),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // Adjust the value for desired roundness
                            ),
                          ),
                          onPressed: () => context.go(Routes.register),
                          child: Text('Get Started'),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
