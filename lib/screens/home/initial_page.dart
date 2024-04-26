import 'package:auth_sql/screens/home/home_page.dart';
import 'package:auth_sql/screens/home/partner_page.dart';
import 'package:auth_sql/screens/home/schedule_temporary.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:auth_sql/screens/home/account_page.dart';
import 'package:auth_sql/screens/home/cashback_page.dart';
import 'package:provider/provider.dart';

import 'dart:async';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDataWithDelay();
  }

  Future<void> _fetchDataWithDelay() async {
    await Future.delayed(const Duration(seconds: 2)); 
    setState(() {
      _isLoading = false; 
      
    });
  }

  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    PartnerPage(),
    ScheduleTemporaryPage(),
    CashBackPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  static const Color colorPrimary = Color(0xFF3D731C);
  static const Color colorSecond = Color(0xFF73D935);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PageStorage(
              child: currentScreen,
              bucket: bucket,
            ),
      backgroundColor: Colors.white,
      extendBody: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimary,
        child: Icon(Icons.qr_code, color: Colors.white, size: 30),
        onPressed: () {},
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 0,
        surfaceTintColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(
                  minWidth: 90,
                  maxWidth: 90,
                ),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = HomePage();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 0 ? colorPrimary : Colors.grey,
                        size: 33,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: currentTab == 0 ? colorPrimary : Colors.grey,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  minWidth: 90,
                  maxWidth: 90,
                ),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = PartnerPage();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        color: currentTab == 1 ? colorPrimary : Colors.grey,
                        size: 33,
                      ),
                      Text(
                        "Parceiros",
                        style: TextStyle(
                            color: currentTab == 1 ? colorPrimary : Colors.grey,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  minWidth: 90,
                  maxWidth: 90,
                ),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = ScheduleTemporaryPage();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: currentTab == 2 ? colorPrimary : Colors.grey,
                        size: 33,
                      ),
                      Text(
                        "Consultas",
                        style: TextStyle(
                          color: currentTab == 2 ? colorPrimary : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  minWidth: 90,
                  maxWidth: 90,
                ),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = CashBackPage();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: currentTab == 3 ? colorPrimary : Colors.grey,
                        size: 33,
                      ),
                      Text(
                        "Cashback",
                        style: TextStyle(
                          color: currentTab == 3 ? colorPrimary : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter UserWidget() {
    final store = Provider.of<AuthStore>(context);
    return SliverToBoxAdapter(
      child: Container(
        color: colorPrimary,
        height: 130,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AccountPage()));
                    },
                    icon: Icon(Icons.account_circle_outlined),
                    color: Colors.white,
                    iconSize: 38,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Olá, ${store.getName()}!',
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter BoxWidget() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.grey[300],
            height: 150,
          ),
        ),
      ),
    );
  }
}
