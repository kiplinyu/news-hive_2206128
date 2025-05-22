import 'package:flutter/material.dart';
import 'package:news_hive/app/features/main/presentation/widgets/bookmark_page.dart';
import 'package:news_hive/app/features/main/presentation/widgets/home_page.dart';
import 'package:news_hive/app/features/main/presentation/widgets/profile_page.dart';
import 'package:news_hive/core/constants/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomePage(), BookmarkPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 10,
          children: [
            SizedBox(
              height: 40,
              child: Image.asset('assets/images/news logo.png'),
            ),
            Text(
              "News Hive",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
