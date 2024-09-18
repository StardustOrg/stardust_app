import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core package
import 'package:provider/provider.dart';
// import 'package:stardust_app_skeleton/features/Search/screens/search.dart';
import 'package:stardust_app_skeleton/features/authentication/screens/login/login.dart';
import 'package:stardust_app_skeleton/models/user.dart';
import 'package:stardust_app_skeleton/services/auth.dart';
import 'package:stardust_app_skeleton/utils/logging/logger.dart';
// import 'package:stardust_app_skeleton/features/home/screens/home.dart';
import 'package:stardust_app_skeleton/utils/theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
      widgetsBinding: widgetsBinding); // Inicializa as ligações do Flutter
  try {
    await Firebase.initializeApp(); // Inicializa o Firebase
  } catch (e) {
    StarLoggerHelper.error('Erro ao inicializar o Firebase: $e');
  }

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserApp?>.value(
      initialData: null,
      value: Auth().user,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: StarTheme.lightTheme,
        darkTheme: StarTheme.darkTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
