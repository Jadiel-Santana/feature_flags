import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/data.dart';
import 'infra/infra.dart';
import 'presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ProductsPresenter presenter;

  @override
  void initState() {
    presenter = ProductsPresenter(
      fetchProductsUsecase: RemoteFetchProducts(),
      remoteConfigUsecase: RemoteConfigImpl(
        config: RemoteConfigAdapter(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: presenter.getValueRemoteConfig(
        key: 'dark_theme',
        defaultValue: false,
      ),
      builder: (context, snapshot) {
        final darkMode = snapshot.data ?? false;

        return MaterialApp(
          title: 'Feature Flags',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: const Color(0xFFF5F5F5),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              color: Colors.deepPurple,
            ),
          ),
          themeMode: (darkMode as bool) ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('pt', 'BR'),
          ],
          home: HomePage(presenter: presenter),
        );
      },
    );
  }
}
