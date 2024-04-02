// import 'package:flutter/material.dart';
// import 'package:hamroshop/models/cart_model.dart';
// import 'package:hamroshop/screen/cart/helper.dart';
// import 'package:provider/provider.dart';

// import 'cart_provider.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//         backgroundColor: const Color.fromARGB(255, 14, 234, 117),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//               future: cart.getData(),
//               builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
//                 if (snapshot.hasData) {
//                   if (snapshot.data!.isEmpty) {
//                     return Center(
//                       child: Text('Your cart is empty 😌',
//                           style: Theme.of(context).textTheme.headline5),
//                     );
//                   } else {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         return CartItem(cartItem: snapshot.data![index]);
//                       },
//                     );
//                   }
//                 }
//                 return SizedBox(); // Return an empty SizedBox if no data yet
//               },
//             ),
//           ),
//           Consumer<CartProvider>(
//             builder: (context, value, child) {
//               return Visibility(
//                 visible: value.getTotalPrice() != 0,
//                 child: Column(
//                   children: [
//                     ReusableWidget(
//                       title: 'Sub Total',
//                       value: r'$' + value.getTotalPrice().toStringAsFixed(2),
//                     ),
//                     ReusableWidget(
//                       title: 'Offer Price ',
//                       value: r'$' + '0',
//                     ),
//                     ReusableWidget(
//                       title: 'Total',
//                       value: r'$' + value.getTotalPrice().toStringAsFixed(2),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/shipping');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             const Color.fromARGB(255, 14, 234, 117),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 60.0, vertical: 13.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       child: const Text(
//                         "Checkout",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Divider(
//                       color: Colors.grey,
//                       thickness: 1,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CartItem extends StatelessWidget {
//   final Cart cartItem;

//   const CartItem({required this.cartItem});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: Image.network(
//           cartItem.image.toString(),
//           height: 100,
//           width: 100,
//         ),
//         title: Text(cartItem.productName.toString()),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               cartItem.unitTag.toString() +
//                   " " +
//                   r"$" +
//                   cartItem.productPrice.toString(),
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             Row(
//               children: [
//                 InkWell(
//                   onTap: () {},
//                   child: Icon(Icons.remove),
//                 ),
//                 Text(cartItem.quantity.toString()),
//                 InkWell(
//                   onTap: () {},
//                   child: Icon(Icons.add),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         trailing: InkWell(
//           onTap: () {},
//           child: Icon(Icons.delete),
//         ),
//       ),
//     );
//   }
// }

// class ReusableWidget extends StatelessWidget {
//   final String title, value;
//   const ReusableWidget({required this.title, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: Theme.of(context).textTheme.subtitle2,
//           ),
//           Text(
//             value.toString(),
//             style: Theme.of(context).textTheme.subtitle2,
//           )
//         ],
//       ),
//     );
//   }
// }
