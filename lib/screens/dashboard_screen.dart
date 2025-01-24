import 'package:flutter/material.dart';
import 'package:speedforcetest/constants/app_constants.dart';
import 'package:speedforcetest/screens/profile_screen.dart';
import 'package:speedforcetest/widgets/card_widget.dart';
import 'package:speedforcetest/widgets/custom_button.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0; // Tracks the selected tab index

  // List of screens for navigation
  final List<Widget> _screens = [
    HomeScreen(),
    Center(child: Text('Jobs Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Earnings Screen', style: TextStyle(fontSize: 24))),
ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        currentIndex: _currentIndex, // Current selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        type: BottomNavigationBarType.fixed, // Fixed navigation bar style
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_sharp),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardWidget(),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text("Invite your friends and get big discounts",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 32),),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text(
                "Invite your other friends to our platform to get plenty of discounts waiting for you!",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: CustomButton.solid(text: "Copy Referral Link", onPressed: () {}),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text("Send to",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: CustomButton.outlined(text: "Send Referral Link", onPressed: () {}),
          )
        ],
      ),
    );
  }
}
