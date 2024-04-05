import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final String? image;
  const Navbar({Key? key, this.image}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              
              color: const Color.fromARGB(255, 24, 209, 138),
              padding: EdgeInsets.only(
                  top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
              child: Column(
                children: const [
                 
                  SizedBox(height: 12),
                  Text(
                    'Hamro Car Parts',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Kathmandu, Nepal',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
              ),
              onTap: () {
                Navigator.pop(context, '/navigation_screen');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text(
                'WishList',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text(
                'Cart',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.my_library_books),
              title: const Text(
                'My Order',
              ),
              onTap: () {},
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text(
                'Profile',
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
