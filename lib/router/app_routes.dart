import '../models/models.dart';
import '../screens/screens.dart';
import 'package:flutter/material.dart';



class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'home', name: 'Home Screen', screen: LoginScreen()),
     
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {

    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({ 
        option.route : (BuildContext context) => option.screen
      });
    }
    return appRoutes;
  }


  static Route<dynamic> onGenerateRoute (RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
  }
}