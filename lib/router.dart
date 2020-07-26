import 'package:flutter/material.dart';
import 'package:flutter_mobx_graphql/screens/artists/artists.screen.dart';
import 'package:flutter_mobx_graphql/screens/search/search.screen.dart';

class Router {
  static onGenerateRoute(RouteSettings settings) {
    if (settings.name == SearchScreen.routeName) {
      return MaterialPageRoute(
        builder: (_) => SearchScreen(),
      );
    } else if (settings.name == ArtistsScreen.routeName) {
      ArtistsScreenArgs args = settings.arguments;

      return MaterialPageRoute(
        builder: (_) => ArtistsScreen(
          name: args.name,
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (_) => Container(
          child: Text("No route found"),
        ),
      );
    }
  }
}
