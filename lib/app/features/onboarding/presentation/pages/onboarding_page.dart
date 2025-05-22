import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_hive/app/router/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:news_hive/app/features/onboarding/presentation/widgets/onboard_button_widget.dart';
import 'package:news_hive/app/features/onboarding/presentation/widgets/onboard_first_page.dart';
import 'package:news_hive/app/features/onboarding/presentation/widgets/onboard_second_page.dart';
import 'package:news_hive/app/features/onboarding/presentation/widgets/onboard_third_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_currentPage < 2)
                      OnboardButtonWidget(
                        text: "Skip",
                        onPressed: () => context.go(Routes.login),
                        variant: OnBoardButtonType.secondary,
                      ),
                    if (_currentPage < 2)
                      OnboardButtonWidget(
                        text: "Next",
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        variant: OnBoardButtonType.primary,
                      ),
                    if (_currentPage == 2)
                      OnboardButtonWidget(
                        text: "Get Started",
                        onPressed: () => context.go(Routes.register),
                        variant: OnBoardButtonType.primary,
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
