import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:auth_sql/store/partner.store.dart';
import 'package:flutter/material.dart';
import 'package:auth_sql/screens/home/account_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
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
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          SearchWidget(
              hintText: 'Pesquisar',
              labelText: 'Encontre profissionais e empresas',
              shouldValidate: false,
              text: _searchController.text,
              textController: _searchController,
              suffixIcon: Icon(Icons.search),
              validator: (text) {
                return null;
              }),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          BoxWidget(),
        ],
      ),
    );
  }

  SliverToBoxAdapter UserWidget() {
    final store = Provider.of<AuthStore>(context);
    final store2 = Provider.of<PartnerStore>(context);

    store2.planIdSearch();

    List<String> names = (store.getName()).split(" ");
    String firstName = names.isNotEmpty ? names[0] : "";
    String lastName = names.length > 1 ? names[1] : "";

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
        height: 150,
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
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Olá, $firstName $lastName!',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter BoxWidget() {
    final store = Provider.of<PartnerStore>(context);
    store.partnerMap2;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          // Change outer Column for vertical separation
          children: [
            for (final partner in store.partnerMap2.values)
              Container(
                // Wrap each partner info in a Container
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0), // Add margin
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color
                  borderRadius: BorderRadius.circular(5), // Add border radius
                  boxShadow: const [
                    // Add subtle shadow
                    BoxShadow(
                      color: Color.fromRGBO(224, 224, 224, 1),
                      blurRadius: 3.0,
                      offset: Offset(0.0, 3.0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0), // Add internal padding
                  child: Column(
                    children: [
                      Text('Nome: ${partner['Nome']}'), // Display partner name
                      Text(
                        'Endereço: ${partner['Endereço']['Rua']}, ${partner['Endereço']['Numero']}, ${partner['Endereço']['CEP']}',
                      ), // Display partner address
                      // ... other widgets
                    ],
                  ),
                ),
              ),
            // ... your existing widgets after partner loop
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter SearchWidget({
    required TextEditingController textController,
    required String text,
    required final String hintText,
    required final String? labelText,
    required final bool shouldValidate,
    required final String? Function(String?)? validator,
    final Widget? suffixIcon,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextFormField(
          initialValue: textController.text,
          validator: shouldValidate ? validator : null,
          decoration: InputDecoration(
            prefixIcon: suffixIcon, // Alterado para prefixIcon
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
