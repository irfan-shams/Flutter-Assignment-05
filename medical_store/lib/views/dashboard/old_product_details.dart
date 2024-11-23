import 'package:flutter/material.dart';
import 'package:medical_store/constant/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final myitems = [
    Image.asset('assets/images/banner-1.jpg'),
    Image.asset('assets/images/banner-2.jpg'),
    Image.asset('assets/images/banner-3.jpg'),
    Image.asset('assets/images/banner-4.jpg'),
  ];
  int myCurrentIndex = 0;

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
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: primaryBgColor,
                              child: CircleAvatar(
                                radius: 23,
                                backgroundImage:
                                    AssetImage("assets/images/irfan.jpg"),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.notifications_outlined,
                              color: primaryBgColor,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: primaryBgColor,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: greySmallBoxBgColor,
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayInterval: const Duration(seconds: 2),
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                myCurrentIndex = index;
                              });
                            },
                          ),
                          items: myitems,
                        ),
                      ),
                      const SizedBox(height: 5),
                      AnimatedSmoothIndicator(
                        activeIndex: myCurrentIndex,
                        count: myitems.length,
                        effect: const WormEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          spacing: 10,
                          dotColor: greyBtnColor,
                          activeDotColor: blueBtnColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                children: [
                  Container(
                    height: 146,
                    width: 327,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/banner-1.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Save Extra on every order",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text("bolo na",
                            style: TextStyle(color: Colors.grey[700])),
                        const SizedBox(height: 4),
                        Text("code", style: TextStyle(color: Colors.grey[700])),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/irfan.jpg"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text("Hello",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Bolo",
                      style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  const Text("500",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Deals of the Day",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryTxtColor,
                    ),
                  ),
                  Text(
                    "More",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryTxtColor,
                    ),
                  ),
                ],
              ),
            ),
            const Text("Deal Boxes"),
          ],
        ),
      ),
    );
  }
}

Widget categoryContainer(
    Color circleTopColor, Color circlBottomColor, String categoryName) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    height: 160,
    width: 90,
    decoration: BoxDecoration(
      color: Colors.white,
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
          color: Colors.white,
          offset: Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          width: 100,
          height: 100,
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
