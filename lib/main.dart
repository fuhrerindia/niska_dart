import 'package:flutter/material.dart';

// COMPONENTS
import 'package:niska/comp/header.dart';
// IMPORTING SCREENS
import './screens/feed.dart';
import './screens/new.dart';
import './screens/leave.dart';

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
    const PlanLeave(),
    const NewRecord(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151515),
      body: screenList[navigatorIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff00454D),
        selectedItemColor: const Color(0xffFFB800),
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: navigatorIndex,
        onTap: (value) {
          setState(() {
            navigatorIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_stream),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Plan Leave',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'New Record',
          ),
        ],
      ),
    );
  }
}
