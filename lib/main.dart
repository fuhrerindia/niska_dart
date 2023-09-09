import 'package:flutter/material.dart';
import 'package:niska/comp/header.dart';
// IMPORTING SCREENS
import './screens/feed.dart';

void main() {
  runApp(const Niska());
}

class Niska extends StatelessWidget {
  const Niska({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Niska',
      home: NavigationWidget(),
    );
  }
}

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({
    super.key,
  });

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int navigatorIndex = 0;
  final List screenList = [
    const FeedScreen(),
    Header(
      title: '2',
    ),
    const FeedScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151515),
      body: screenList[navigatorIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff00454D),
        fixedColor: const Color(0xffFFB800),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: navigatorIndex,
        onTap: (value) {
          setState(() {
            navigatorIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.view_stream), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
    );
  }
}
