import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/screens/home_page.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:auth_sql/store/calendar/calendario.store.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => AuthStore()),
        Provider<CalendarioStore>(create: (_) => CalendarioStore()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return MultiProvider(
      providers: [
        Provider<AuthStore>(
          create: (_) => AuthStore(),
        )
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
            // Verifique se há um usuário atualmente autenticado
            final currentUser = auth.currentUser;
            if (currentUser != null) {
              // Se o usuário estiver autenticado, vá para a tela principal
              return const HomePage();
            } else {
              // Se o usuário não estiver autenticado, vá para a tela de login
              return const LoginScreen();
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
