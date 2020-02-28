import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/app_manager/app_manager.dart';
import 'package:project/screens/add_new_offer/add_new_offer.dart';
import 'package:project/screens/add_new_product/add_new_product.dart';
import 'package:project/screens/login/login.dart';
import 'package:project/screens/offer_preview/offer_preview.dart';
import 'package:project/screens/sign_up/sign_up.dart';
import 'package:project/screens/sign_up/upgrade_to_company_account.dart';
import 'package:project/screens/suggestion/suggestion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar", "AE"),
        ],
        locale: Locale("ar", "AE"),
      initialRoute: '/',
      routes: {
        '/' : (context) => AppManager(),
        '/login' : (context) => LoginScreen(),
        '/signUp' : (context) => SignUpScreen(),
        '/offerPreview' : (context) => OfferPreviewScreen(),
        '/addNewProduct' : (context) => AddNewProductScreen(),
        '/suggestions' : (context) => SuggestionScreen(),
        '/addNewOffer' : (context) => AddNewOfferScreen(),
        '/upgradeToCompanyAccount' : (context) => UpgradeToCompanyAccount()
      },
    );
  }
}
