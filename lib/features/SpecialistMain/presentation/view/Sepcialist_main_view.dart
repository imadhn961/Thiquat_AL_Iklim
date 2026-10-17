import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/features/SpecialistMain/presentation/view/widgets/customSpecialist_bottom_nav_bar.dart';
import 'package:thiquat_al_iklim/features/bookingPage/bookingPage.dart';
import 'package:thiquat_al_iklim/features/home/home.dart';
import 'package:thiquat_al_iklim/features/profile/profile.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/specialistInbox.dart';
import 'package:thiquat_al_iklim/shared/enums/user_role.dart';
import 'package:thiquat_al_iklim/shared/models/user_model.dart';

class SpecialistMainView extends StatefulWidget {
  const SpecialistMainView({super.key, this.initialIndex = 0});

  static const String routeName = 'SpecialistMain';

  final int initialIndex;

  @override
  State<SpecialistMainView> createState() => _SpecialistMainViewState();
}

class _SpecialistMainViewState extends State<SpecialistMainView> {
  late int _currentIndex = widget.initialIndex;

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
          const SpecialistInboxView(),
          const BookingPageView(),
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: CustomSpecialistBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
