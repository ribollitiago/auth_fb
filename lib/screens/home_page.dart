import 'package:flutter/material.dart';
import 'package:auth_sql/screens/agendamento/agendamento_page.dart';
import 'package:auth_sql/screens/minhaconta_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        body: CustomScrollView(
          slivers: [
            AppBarWidget(title: 'SIM CLUB', context: context),
            BoxWidget(),
            BoxWidget(),
            BoxWidget(),
            BoxWidget(),
            BoxWidget(),
            BoxWidget(),
          ],
        ));
  }

  SliverAppBar AppBarWidget(
      {required String title, required BuildContext context}) {
    return SliverAppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      expandedHeight: 120,
      centerTitle: true,
      pinned: true,
      backgroundColor: Colors.green,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            //search function
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MinhaConta()));
        },
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
              bottom: 10,
              right: 30,
              left: 30, // Adicione essa linha para alinhar o texto à esquerda
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: const Text(
                        'Agendar nova consulta?',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AgendamentoPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text(
                      'Clique aqui',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
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
            color: Colors.green[300],
            height: 150,
          ),
        ),
      ),
    );
  }
}
