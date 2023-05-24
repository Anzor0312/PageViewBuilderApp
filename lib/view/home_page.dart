import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pageview/view/no_connection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  bool isConnected = false;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  PageController pageController = PageController(keepPage: true);
  @override
  void initState() {
    super.initState();
    CheckConnection();
    scrollItem();
  }

  Widget build(BuildContext context) {
    return isConnected
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Home Page"),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://source.unsplash.com/random/?$index"),
                                fit: BoxFit.fill),
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                      );
                    },
                  ),
                )
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    AdaptiveTheme.of(context).setLight();
                  },
                  child: const Text("Ligth"),
                ),
                FloatingActionButton(
                  onPressed: () {
                    AdaptiveTheme.of(context).setDark();
                  },
                  child: const Text("Dark"),
                ),
              ],
            ),
          )
        : const NoConnectionPage();
  }

  // ignore: non_constant_identifier_names
  CheckConnection() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        isConnected = true;
        Fluttertoast.showToast(msg: "You are online");
        setState(() {});
      } else {
        isConnected = false;
        Fluttertoast.showToast(msg: "You are offline");
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription!.cancel();
    super.dispose();
  }

  void scrollItem() async {
    for (int i = 0; i < 10; i) {
      await Future.delayed(const Duration(seconds: 3));
      pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubicEmphasized);
    }
  }
}
