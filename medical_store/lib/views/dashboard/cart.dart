import 'package:flutter/material.dart';
import 'package:medical_store/constant/color.dart';
import 'package:medical_store/views/dashboard/dashboard.dart';
import 'package:medical_store/views/dashboard/product_model.dart';

class CartPage extends StatefulWidget {
  static List<Product> cartItems = [];

  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Method to calculate order total (price before discounts)
  double calculateOrderTotal() {
    return CartPage.cartItems.fold(
      0.0,
      (total, product) => total + (product.price * product.quantity),
    );
  }

  // Method to calculate total discount
  double calculateTotalDiscount() {
    return CartPage.cartItems.fold(
      0.0,
      (total, product) {
        // ignore: unnecessary_null_comparison
        if (product.discountedPrice != null) {
          return total +
              ((product.price - product.discountedPrice) * product.quantity);
        }
        return total;
      },
    );
  }

  // Method to calculate final total price (after discounts)
  double calculateTotalPrice() {
    return CartPage.cartItems.fold(
      0.0,
      (total, product) =>
          total + ((product.discountedPrice) * product.quantity),
    );
  }

  // Method to calculate total number of items in the cart
  int calculateTotalItems() {
    return CartPage.cartItems.fold(
      0,
      (total, product) => total + product.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: primaryBgColor,
        title: const Text(
          'Your Cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: primaryTxtColor,
          ),
        ),
      ),
      body: CartPage.cartItems.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryTxtColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueBtnColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardView()),
                    );
                  },
                  child: const Text(
                    'Continue Shopping',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryBgColor,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${calculateTotalItems()} items in your cart',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: secondaryTxtColor,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardView()),
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: cartBtnColor,
                        ),
                        label: const Text('Add more',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: cartBtnColor,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: CartPage.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = CartPage.cartItems[index];
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: greyBtnColor, // Color of the border
                              width: 0.5, // Thickness of the border
                            ),
                          ),
                        ),
                        child: ListTile(
                          // tileColor: Colors.amber,
                          leading: Container(
                            width: 50,
                            height: 60,
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: greyBigBoxBgColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              product.imageAsset,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryTxtColor,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.description,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryTxtColor,
                                ),
                              ),
                              Text(
                                'Rs.${product.price.toString()}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: primaryTxtColor,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Decrement Button
                              Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  color: incrementBgColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: const BoxDecoration(
                                        color: decrementColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 12,
                                          color: blueBtnColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (product.quantity > 1) {
                                              product
                                                  .quantity--; // Decrement quantity
                                            } else {
                                              CartPage.cartItems.removeAt(
                                                  index); // Remove if quantity is 0
                                            }
                                          });
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(
                                          //   SnackBar(
                                          //       duration:
                                          //           const Duration(seconds: 1),
                                          //       content: Text(
                                          //           '${product.name} updated')),
                                          // );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        "${product.quantity}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // Increment Button
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: const BoxDecoration(
                                        color: incrementColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.add,
                                          size: 12,
                                          color: primaryBgColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            product
                                                .quantity++; // Increment quantity
                                          });
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(
                                          //   SnackBar(
                                          //       duration:
                                          //           const Duration(seconds: 1),
                                          //       content: Text(
                                          //           '${product.name} updated')),
                                          // );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Delete Button
                              IconButton(
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  size: 18,
                                  color: secondaryTxtColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    CartPage.cartItems.removeAt(
                                        index); // Remove product from cart
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: const Duration(seconds: 1),
                                        content: Text(
                                            '${product.name} removed from cart')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Payment Summary Section
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Summary',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryTxtColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Order Total:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: secondaryTxtColor,
                            ),
                          ),
                          Text(
                            calculateOrderTotal().toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryTxtColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Item Discount:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: secondaryTxtColor,
                            ),
                          ),
                          Text(
                            '-${calculateTotalDiscount().toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryTxtColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: secondaryTxtColor,
                            ),
                          ),
                          Text(
                            'Free',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryTxtColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: primaryTxtColor,
                            ),
                          ),
                          Text(
                            'Rs. ${calculateTotalPrice().toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: primaryTxtColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: blueBtnColor,
                    ),
                    width: MediaQuery.of(context).size.width * .9,
                    height: 45,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "PLACE ORDER",
                        style: TextStyle(
                          color: primaryBgColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
    );
  }
}
