import 'package:flutter/material.dart';
import 'package:medical_store/constant/color.dart';
import 'package:medical_store/views/dashboard/cart.dart';
import 'package:medical_store/views/dashboard/product_list.dart';
import 'package:medical_store/views/dashboard/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:rating_summary/rating_summary.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final pageController = PageController();

  int myCurrentIndex = 0;

  final int totalRatings = 500; // Total number of ratings
  final Map<int, int> ratings = {
    5: 300,
    4: 100,
    3: 50,
    2: 30,
    1: 20,
  }; // Number of ratings for each level

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: primaryBgColor,
        actions: [
          Stack(
            clipBehavior:
                Clip.none, // Ensures badge is visible outside Stack bounds
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: primaryTxtColor,
                ),
                onPressed: () {
                  // Notification button action
                },
              ),
              Positioned(
                right: 8, // Position the badge to the top-right
                top: 10,
                child: Container(
                  height: 11,
                  width: 11,
                  padding: const EdgeInsets.all(2), // Padding inside the badge
                  decoration: const BoxDecoration(
                    color: primaryBgColor, // Badge background color
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
              // Navigator.pushNamed(context, '/cart');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            icon: const Icon(
              Icons.local_mall_outlined,
              color: primaryTxtColor,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: primaryTxtColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                widget.product.brandName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: primaryTxtColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: greyBigBoxBgColor,
              ),
              child: CarouselSlider.builder(
                itemCount: products.length,
                itemBuilder: (context, index, realIndex) {
                  final product = products[index];
                  return ClipRRect(
                    child: Image.asset(
                      product.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSmoothIndicator(
                  activeIndex: myCurrentIndex,
                  count: products.length,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                    dotColor: greyBtnColor,
                    activeDotColor: blueBtnColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rs.${widget.product.price.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: secondaryTxtColor,
                              decoration: TextDecoration
                                  .lineThrough, // Strikethrough original price
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Rs.${widget.product.discountedPrice.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: primaryTxtColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: primaryTxtColor,
                        ),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {
                      CartPage.cartItems.add(widget.product); // Add to cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            duration: const Duration(seconds: 1),
                            content:
                                Text('${widget.product.name} added to cart!')),
                      );
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: cartBtnColor,
                    ),
                    label: const Text('Add to Cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: cartBtnColor,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: greyBtnColor, // Border color
                    width: 0.5, // Border width (1 pixel)
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "Package Size",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: primaryTxtColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: orangeBgColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: orangeBoxColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rs.${widget.product.discountedPrice.toInt()}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: orangeBoxColor,
                          ),
                        ),
                        const Text(
                          "100 pellets",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: orangeBoxColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: greySmallBoxBgColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: greySmallBoxBgColor)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rs.199',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: primaryTxtColor,
                          ),
                        ),
                        Text(
                          "200 pellets",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: primaryTxtColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: greySmallBoxBgColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: greySmallBoxBgColor)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rs.299',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: primaryTxtColor,
                          ),
                        ),
                        Text(
                          "300 pellets",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: primaryTxtColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "Product Details",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: primaryTxtColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                widget.product.productDetails,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: secondaryTxtColor,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: primaryTxtColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                widget.product.productDetails,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: secondaryTxtColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Expiry Date',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryTxtColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.product.expiryDate,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: secondaryTxtColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Brand Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryTxtColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.product.brandName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: secondaryTxtColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: List.generate(
                  5,
                  (index) {
                    int rating = 5 - index; // For 5, 4, 3, 2, 1 stars
                    int ratingCount = ratings[rating] ?? 0;
                    double ratingPercentage =
                        (ratingCount / totalRatings) * 100;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Text(
                            '$rating',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: greySmallBoxBgColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: ratingCount / totalRatings,
                                  child: Container(
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: blueBtnColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${ratingPercentage.toStringAsFixed(0)}%',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: blueBtnColor,
                ),
                width: MediaQuery.of(context).size.width * .9,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: const Text(
                    "GO TO CART",
                    style: TextStyle(
                      color: primaryBgColor,
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            // child: Column(
            //   children: List.generate(
            //     5,
            //     (index) {
            //       int rating = 5 - index; // For 5, 4, 3, 2, 1 stars
            //       int ratingCount = ratings[rating] ?? 0;
            //       double ratingPercentage = (ratingCount / totalRatings);
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 4.0),
            //         child: Row(
            //           children: [
            //             Text(
            //               '$rating',
            //               style: const TextStyle(fontSize: 16),
            //             ),
            //             const SizedBox(width: 8),
            //             const Icon(
            //               Icons.star,
            //               color: Colors.yellow,
            //               size: 10,
            //             ),
            //             const SizedBox(width: 8),
            //             Expanded(
            //               child: Stack(
            //                 children: [
            //                   Container(
            //                     height: 10,
            //                     decoration: BoxDecoration(
            //                       color: Colors.grey[300],
            //                       borderRadius: BorderRadius.circular(8),
            //                     ),
            //                   ),
            //                   FractionallySizedBox(
            //                     widthFactor: ratingPercentage,
            //                     child: Container(
            //                       height: 10,
            //                       decoration: BoxDecoration(
            //                         color: Colors.amber,
            //                         borderRadius: BorderRadius.circular(8),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             const SizedBox(width: 8),
            //             Text(
            //               '$ratingCount',
            //               style: const TextStyle(fontSize: 16),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //   child: const Column(
            //     children: [
            //       RatingSummary(
            //         counter: 13,
            //         average: 3.846,
            //         counterFiveStars: 5,
            //         counterFourStars: 4,
            //         counterThreeStars: 2,
            //         counterTwoStars: 1,
            //         counterOneStars: 1,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
