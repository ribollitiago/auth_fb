import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:auth_sql/screens/home/account_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color colorPrimary = Color(0xFF3D731C);
  static const Color colorSecond = Color(0xFF73D935);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          UserWidget(),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          BoxWidget(),
          BoxWidget(),
          BoxWidget(),
          BoxWidget(),
          BoxWidget(),
          BoxWidget(),
        ],
      ),
    );
  }

  SliverToBoxAdapter UserWidget() {
    final store = Provider.of<AuthStore>(context);
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: colorPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(
                  0, 3), // altere o deslocamento vertical conforme necessário
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        height: 150,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Olá, ${store.getName()}!',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter BoxWidget() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: Colors.grey[400],
            height: 150,
          ),
        ),
      ),
    );
  }
}
