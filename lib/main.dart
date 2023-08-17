import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gadgethive/core/store.dart';
import 'package:gadgethive/pages/home_page.dart';
import 'package:gadgethive/pages/login_page.dart';
import 'package:gadgethive/utils/routes.dart';
import 'package:gadgethive/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'firebase_options.dart';
import 'pages/cart_page.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey =
      'pk_test_51N0TdSSFju6HODUAZibXKlIlj8M0nfWK69IiKGcKt2taT1U31DGm2V2Zl8WST1yF1Gpl8KHljDwip9gWvexRa85a00tGc2KMuA';
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
