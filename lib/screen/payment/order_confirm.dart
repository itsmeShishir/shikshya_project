import 'package:flutter/material.dart';
import 'package:hamroshop/api/orderAPI.dart';
import 'package:hamroshop/models/cart_model.dart';
import 'package:hamroshop/screen/cart/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  double? getTotalAmount;

  String? productName;
  String? productImage;
  var address;

  @override
  void initState() {
    super.initState();
    getTotal();
  }

  Future<void> getTotal() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      getTotalAmount = preferences.getDouble('total_price') ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    address = arguments?['address'] ?? '';
    final phone = arguments?['phone'] ?? '';
    final country = arguments?['country'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Order'),
        elevation: 4.0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 14, 234, 117),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShippingDetails(address, phone, country),
            const SizedBox(height: 30),
            _buildCartDetails(),
            const SizedBox(height: 30),
            _buildPriceCalculation(),
            const SizedBox(height: 20),
            _buildPaymentButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingDetails(String address, String phone, String country) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shipping Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Divider(thickness: 2),
        const SizedBox(height: 10),
        Text("Address: $address", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Text("Phone Number: $phone", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Text("Country: $country", style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildCartDetails() {
    return Consumer<CartProvider>(
      builder: (context, cart, _) {
        final cartItems = cart.cartItems;
        if (cartItems.isEmpty) {
          return _buildEmptyCart();
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartItems[index];
            if (cartItem is Map<String, dynamic>) {
              final productName = cartItem['name'] as String?;
              final productImage = cartItem['image'] as String?;
              if (productName != null && productImage != null) {
                return _buildCartItem(productName, productImage);
              }
            }
            return SizedBox(); // Or any other widget as per your requirement
          },
        );
      },
    );
  }

  Widget _buildEmptyCart() {
    return Column(
      children: [
        Image(image: AssetImage('assets/image/empty-cart.png')),
        const SizedBox(height: 20),
        Text('Your cart is empty 😌',
            style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        Text(
          'Explore products and shop your favorite items',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _buildCartItem(String productName, String productImage) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: productImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                height: 130,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(productName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Add any other details you want to display
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


 Widget _buildPriceCalculation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price Calculation",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Divider(thickness: 2, height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Total",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            getTotalAmount != null
                ? Text(
                    "${getTotalAmount!.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                : Text(
                    "N/A",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Delivery Charge",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "\$0",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Subtotal",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            getTotalAmount != null
                ? Text(
                    "${getTotalAmount!.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                : Text(
                    "N/A",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentButton() {
    return ElevatedButton(
      onPressed: () async {
        await makePayment(getTotalAmount!.toStringAsFixed(0));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 14, 234, 117),
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 13.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      child: const Text(
        "Payment",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<void> makePayment(String total) async {
    // Implement payment logic here
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    // Implement payment intent creation logic here
    return {};
  }

  String calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
