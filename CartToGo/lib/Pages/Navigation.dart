import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carttogo/Pages/LoyaltyCard.dart';
import 'package:carttogo/Pages/ShoppingCart.dart';
import 'package:google_fonts/google_fonts.dart';

class Navi extends StatefulWidget {
  const Navi({Key? key}) : super(key: key);
  @override
  NaviState createState() => NaviState();
}

class NaviState extends State<Navi> {
  int Myindex = 0;
  GlobalKey<CurvedNavigationBarState> _NavKey = GlobalKey();
  //var Pages = [ShoppingCart(), LoyaltyCard()];
  late ShoppingCart tab1;
  void setPage(index) {
    final CurvedNavigationBarState? navigationBarState = _NavKey.currentState;
    navigationBarState?.setPage(index);
  }

  void initState() {
    tab1 = ShoppingCart(setPage);
    super.initState();
  }

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return tab1;
      case 1:
        return LoyaltyCard();
    }
    return LoyaltyCard();
  }

  @override
  Widget build(BuildContext context) {
    bool v1 = false;
    double s1 = 0;
    bool v2 = false;
    double s2 = 0;
    Myindex == 1 ? v2 = false : v2 = true;
    Myindex == 01 ? s2 = 0.04 : s2 = 0.066;
    Myindex == 0 ? v1 = false : v1 = true;
    Myindex == 0 ? s1 = 0.04 : s1 = 0.066;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        //backgroundColor: Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: _NavKey,
          items: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * s1,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0049,
                  ),
                  Icon(Icons.shopping_cart_outlined,
                      size: 30,
                      color: Myindex == 0
                          ? Color.fromARGB(255, 35, 61, 255)
                          : Colors.white),
                  Visibility(
                    child: Text(
                      "?????? ????????????",
                      style: TextStyle(color: Colors.white),
                    ),
                    visible: v1,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * s2,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0049,
                  ),
                  Icon(Icons.credit_card,
                      size: 30,
                      color: Myindex == 1
                          ? Color.fromARGB(255, 35, 61, 255)
                          : Colors.white),
                  Visibility(
                    child: Text(
                      "?????????? ????????????",
                      style: TextStyle(color: Colors.white),
                    ),
                    visible: v2,
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.white24,
          buttonBackgroundColor: Colors.white24,
          height: 75,
          onTap: (index) {
            setState(() {
              Myindex = index;
            });
          },
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: Duration(milliseconds: 400),
          color: Color.fromARGB(255, 35, 61, 255),
        ),
        body: pageChooser(Myindex),
      ),
    );
  }
}
