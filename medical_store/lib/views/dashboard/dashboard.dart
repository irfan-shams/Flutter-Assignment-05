import 'package:flutter/material.dart';
import 'package:medical_store/constant/color.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medical_store/views/dashboard/cart.dart';
import 'package:medical_store/views/dashboard/product_details.dart';
import 'package:medical_store/views/dashboard/product_list.dart';
import 'package:medical_store/views/dashboard/profile.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: blueBtnColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
              ),
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -220,
                    left: -170,
                    child: Container(
                      width: 420,
                      height: 420,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(300),
                        color: secondaryBgColor.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundColor: primaryBgColor,
                              child: CircleAvatar(
                                radius: 23,
                                backgroundImage:
                                    AssetImage("assets/images/irfan.jpg"),
                              ),
                            ),
                            const Spacer(),
                            Stack(
                              clipBehavior: Clip
                                  .none, // Ensures badge is visible outside Stack bounds
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.notifications_outlined,
                                    color: primaryBgColor,
                                  ),
                                  onPressed: () {
                                    // Notification button action
                                  },
                                ),
                                Positioned(
                                  right: 8,
                                  top: 10,
                                  child: Container(
                                    height: 11,
                                    width: 11,
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: primaryBgColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CartPage()),
                                );
                              },
                              icon: const Icon(
                                Icons.local_mall_outlined,
                                color: primaryBgColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Hello, Irfan",
                          style: TextStyle(
                            fontSize: 24,
                            color: primaryBgColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryBgColor,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Quick Medical Store',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          style: const TextStyle(
                            fontSize: 16,
                            color: secondaryTxtColor,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: primaryBgColor,
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: secondaryTxtColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: primaryBgColor),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: primaryBgColor),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            hintText: 'Search Medicine & Healthcare products',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: secondaryTxtColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                "Top Categories",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: primaryTxtColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryContainer(const Color(0xFFFF9598),
                      const Color(0xFFFF70A7), "Dental"),
                  const SizedBox(width: 10),
                  categoryContainer(const Color(0xFF19E5A5),
                      const Color(0xFF15BD92), "Wellness"),
                  const SizedBox(width: 10),
                  categoryContainer(const Color(0xFFFFC06F),
                      const Color(0xFFFF793A), "Homeo"),
                  const SizedBox(width: 10),
                  categoryContainer(const Color(0xFF4DB7FF),
                      const Color(0xFF3E7DFF), "Eye Care"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 146,
                    width: 300,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDAF3FA),
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/banner-bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Save Extra on \nevery order",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: blueBtnColor,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Etiam mollis metus \nnon faucibus.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: primaryTxtColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Deals of the Day",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryTxtColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "More",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: blueBtnColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 280,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: primaryBgColor,
                        boxShadow: const [
                          BoxShadow(
                            color: greyBigBoxBgColor,
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: primaryBgColor,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                            child: Image.asset(
                              product.imageAsset,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    color: primaryTxtColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.description,
                                  style: const TextStyle(
                                    color: primaryTxtColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Rs.${product.price.toString()}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: primaryTxtColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 24,
                                    width: 40,
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      color: orangeRatingColor,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 13,
                                          color: primaryBgColor,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "2",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: primaryBgColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
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
              color: primaryBgColor,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
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

Widget categoryContainer(
    Color circleTopColor, Color circlBottomColor, String categoryName) {
  return Container(
    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
    width: 65,
    height: 130,
    decoration: BoxDecoration(
      color: primaryBgColor,
      borderRadius: BorderRadius.circular(50),
      boxShadow: const [
        BoxShadow(
          color: greyBigBoxBgColor,
          offset: Offset(
            0.0,
            5.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 2.0,
        ),
        BoxShadow(
          color: primaryBgColor,
          offset: Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                circleTopColor,
                circlBottomColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Text(
          categoryName,
          style: const TextStyle(
            color: primaryTxtColor,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
