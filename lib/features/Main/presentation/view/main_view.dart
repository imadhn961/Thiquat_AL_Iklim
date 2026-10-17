import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/features/Main/presentation/view/widgets/custom_bottom_nav_bar.dart';
import 'package:thiquat_al_iklim/features/bookingPage/bookingPage.dart';
import 'package:thiquat_al_iklim/features/home/home.dart';
import 'package:thiquat_al_iklim/features/profile/profile.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'UserMain';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int _currentIndex = 0;

  static final UserModel _demoCurrentUser = UserModel(
    uid: 'u001',
    name: 'هالة كرم',
    email: 'hala.karam@example.com',
    phoneNumber: '03 123 456',
    password: '',
    createdAt: DateTime(2025, 1, 1),
    role: UserRole.user,
  );

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeView(),
          const BookingPageView(),
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
