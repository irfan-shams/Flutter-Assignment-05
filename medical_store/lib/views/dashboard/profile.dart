import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medical_store/constant/color.dart';
import 'package:medical_store/views/dashboard/cart.dart';
import 'package:medical_store/views/dashboard/dashboard.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Profile",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: primaryTxtColor,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/irfan.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Irfan Shams",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Welcome to Quick Medical Store",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: greyBtnColor, // Color of the border
                    width: 0.5, // Thickness of the border
                  ),
                ),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.article_outlined,
                ),
                title: const Text("Edit Profile"),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 16,
                ),
                onTap: () {},
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: greyBtnColor, // Color of the border
                    width: 0.5, // Thickness of the border
                  ),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.description_outlined),
                title: const Text('My Orders'),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 16,
                ),
                onTap: () {},
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: greyBtnColor, // Color of the border
                    width: 0.5, // Thickness of the border
                  ),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.schedule_outlined),
                title: const Text('Billing'),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 16,
                ),
                onTap: () {},
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: greyBtnColor, // Color of the border
                    width: 0.5, // Thickness of the border
                  ),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.help_outline_outlined),
                title: const Text('FAQs'),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 16,
                ),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: greyBigBoxBgColor,
              offset: Offset(
                0.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 12.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 2,
          ),
          child: GNav(
            color: secondaryTxtColor,
            activeColor: blueBtnColor,
            onTabChange: (index) {
              // print(index);
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardView()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              } else if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileView()),
                );
              }
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
              ),
              GButton(
                icon: Icons.notifications_outlined,
              ),
              GButton(
                icon: Icons.add_box,
                margin: EdgeInsets.only(bottom: 20),
              ),
              GButton(
                icon: Icons.local_mall_outlined,
              ),
              GButton(
                icon: Icons.person_outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
