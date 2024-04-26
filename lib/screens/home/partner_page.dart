import 'package:auth_sql/screens/home/account_page.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PartnerPage extends StatefulWidget {
  const PartnerPage({super.key});

  @override
  State<PartnerPage> createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {
  static const Color colorPrimary = Color(0xFF3D731C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          UserWidget(),
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
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
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 1),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        height: 95,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: SvgPicture.asset(
                    'assets/svg/SIM_CLUB_LOGO.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
                Spacer(),
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
