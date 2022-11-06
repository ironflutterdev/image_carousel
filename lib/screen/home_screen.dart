import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      int currentPage = pageController.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [1, 2, 3, 4, 5]
              .map((e) =>
                  Image.asset('asset/img/image_$e.jpeg', fit: BoxFit.cover))
              .toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    // TODO: implement dispose
    super.dispose();
  }
}
