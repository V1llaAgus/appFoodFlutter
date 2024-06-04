import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'src/Base/Views/base_view.dart';
import 'src/colors/colors.dart';
import 'src/features/presentation/StateProviders/loading_stateprovider.dart';
import 'src/features/presentation/StateProviders/user_state_provider.dart';
import 'src/routes/routes.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingStateProvider()),
        ChangeNotifierProvider(create: (_) => UserStateProvider())
      ],
      child: MyAppUserState(),
    );
  }
}

class MyAppUserState extends StatelessWidget with BaseView {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: coordinator.start(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MyApp(initialRoute: snapshot.data);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class MyApp extends StatelessWidget {
  final String _initialRoute;

  const MyApp({Key? key, required String initialRoute})
      : _initialRoute = initialRoute,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: _initialRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: orange,
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
    );
  }
}
