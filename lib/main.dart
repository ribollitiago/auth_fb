import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/screens/home_page.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:auth_sql/store/calendar/calendar.store.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) => runApp(const MyApp()));
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
        Provider<CalendarStore>(
          create: (_) => CalendarStore(),
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

            if (currentUser != null) {
              final store = Provider.of<AuthStore>(context);

              store.recoveryData(currentUser.uid);
              print('Usuário logado: ${currentUser.uid}');
              return const HomePage();
            } else {
              print('Sem usuario');
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
