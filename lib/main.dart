import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/screens/home_page.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:auth_sql/store/calendar/calendario.store.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Inicialização do Firebase com as opções padrão
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(
          create: (_) => AuthStore(),
        ),
        Provider<CalendarioStore>(
          create: (_) => CalendarioStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
        ),
        home: Builder(
          builder: (context) {
            final auth = FirebaseAuth.instance;
            final currentUser = auth.currentUser;

            // Se o usuário estiver autenticado, vá para a tela principal
            if (currentUser != null) {
              final store = Provider.of<AuthStore>(context);
              // Recupere os dados do usuário após o login automático ser feito
              store.recuperacaoDados(currentUser.uid);
              print('Usuário logado: ${currentUser.uid}');
              return const HomePage();
            } else {
              print('Sem usuario');
              // Se o usuário não estiver autenticado, vá para a tela de login
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
