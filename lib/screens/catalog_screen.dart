import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/cart_provider.dart';
import '../providers/theme_provider.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  final List<Book> dummyBooks = [
    Book(
      id: 'b1',
      title: 'Flutter & Dart: Cross-Platform App Development (2025)',
      author: 'Mark J. Price',
      price: 125000,
      imageUrl: '',
    ),
    Book(
      id: 'b2',
      title: 'Clean Architecture with Flutter in Practice (2025)',
      author: 'Aleksei Gusev',
      price: 110000,
      imageUrl: '',
    ),
    Book(
      id: 'b3',
      title: 'Real-World State Management in Flutter (2025)',
      author: 'Prasanna Kumar',
      price: 98000,
      imageUrl: '',
    ),
    Book(
      id: 'b4',
      title: 'Cybersecurity & Digital Forensics Fundamentals (2025)',
      author: 'Dr. Iwan Setiawan',
      price: 105000,
      imageUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('NusaBookstore'),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),
              Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return cart.totalItems == 0
                      ? const SizedBox.shrink()
                      : Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '${cart.totalItems}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: dummyBooks.length,
        itemBuilder: (ctx, index) {
          final book = dummyBooks[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.book, size: 40, color: Colors.blue),
              title: Text(
                book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Penulis: ${book.author}'),
                  Text(
                    'Rp ${book.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().addItem(book);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${book.title} ditambahkan ke keranjang!'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Tambah'),
              ),
            ),
          );
        },
      ),
    );
  }
}
