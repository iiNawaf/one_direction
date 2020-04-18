import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/admin_dashboard/admin_home.dart';
import 'package:project/app_manager/app_manager.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/suggestions_provider.dart';
import 'package:project/screens/add_new_offer/add_new_offer.dart';
import 'package:project/screens/add_new_product/add_new_product.dart';
import 'package:project/screens/change_password/change_password.dart';
import 'package:project/screens/login/forgot_password.dart';
import 'package:project/screens/login/login.dart';
import 'package:project/screens/manage_products_and_offers/manage_products_and_offers.dart';
import 'package:project/screens/my_offers/add_product_offers.dart';
import 'package:project/screens/my_offers/my_offers.dart';
import 'package:project/screens/offer_preview/offer_preview.dart';
import 'package:project/screens/rating/rating.dart';
import 'package:project/screens/sign_up/sign_up.dart';
import 'package:project/screens/sign_up/upgrade_to_company_account.dart';
import 'package:project/screens/splash_screen/splash_screen.dart';
import 'package:project/screens/suggestion/suggestion.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offer.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OffersProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: DiscountProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SuggestionsProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, _) => GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(
            theme: ThemeData(fontFamily: 'Cairo'),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("ar", "AE"),
            ],
            locale: Locale("ar", "AE"),
            home: FutureBuilder(
              future: authProvider.autoLogin(),
              builder: (ctx, result) => result.connectionState == ConnectionState.waiting ? SplashScreen() : AdminHome(),
            ),
            routes: {
              '/home': (context) => AppManager(),
              '/login': (context) => LoginScreen(),
              '/signUp': (context) => SignUpScreen(),
              '/offerPreview': (context) => OfferPreviewScreen(),
              '/addNewProduct': (context) => AddNewProductScreen(),
              '/suggestions': (context) => SuggestionScreen(),
              '/addNewOffer': (context) => AddNewOfferScreen(),
              '/upgradeToCompanyAccount': (context) => UpgradeToCompanyAccount(),
              '/myOffers': (context) => MyOffersScreen(),
              '/addProductOffers': (context) => AddProductOffersScreen(),
              '/manage': (context) => ManageProductAndOffers(),
              '/editProduct': (context) => EditProduct(),
              '/editOffer': (context) => EditOffer(),
              '/forgotPassword': (context) => ForgotPasswordScreen(),
              '/changePassword': (context) => ChangePasswordScreen(),
              '/rating': (context) => RatingScreen(),
            },
          ),
        ),
      ),
    );
  }
}
