import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_app_with_baya/futture/home/domein/useCase/get_products_use_case.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/data_sourse/product_data_sourse.dart';
import '../../data/repositories/product_repositories_impl.dart';
import '../../domein/entities/product_entity.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  late final GetProductsUseCase _getProductsUseCase;
  late List<ProductEntity> _products = [];

  bool _isLike = false;

  @override
  void initState() {
    super.initState();

    _getProductsUseCase = GetProductsUseCase(
        ProductRepositoriesImpl(ProductLocalDataSource()));
    getProducts();

    // Запускаем таймер для автоматической прокрутки
    _timer =
        Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Останавливаем таймер при удалении виджета
    _pageController.dispose();
    super.dispose();
  }

  Future<void> getProducts() async {
    final products = await _getProductsUseCase();
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 283,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  Image.asset("assets/images/slider_1.png"),
                  Image.asset("assets/images/slider_1.png"),
                  Image.asset("assets/images/slider_1.png"),
                  Image.asset("assets/images/slider_1.png"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: const WormEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.price.toString()),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: product.isLike
                          ? const Icon(Icons.favorite,
                              color: Colors.red)
                          : const Icon(Icons.favorite_border),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
