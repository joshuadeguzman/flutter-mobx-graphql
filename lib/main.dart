import 'package:flutter/material.dart';
import 'package:flutter_mobx_graphql/datasources/spotify_api_datasource.dart';
import 'package:flutter_mobx_graphql/repositories/spotify_api_repository.dart';
import 'package:flutter_mobx_graphql/router.dart';
import 'package:flutter_mobx_graphql/screens/artists/stores/artists.store.dart';
import 'package:flutter_mobx_graphql/screens/search/search.screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql/client.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  HttpLink _httpLink;
  GraphQLClient _client;
  ISpotifyApiDataSource _spotifyApiDataSource;
  ISpotifyApiRepository _spotifyApiRepository;

  @override
  void initState() {
    _httpLink = HttpLink(
      uri: 'https://spotify-graphql-server.herokuapp.com/graphql',
    );

    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );

    _spotifyApiDataSource = SpotifyApiDataSource(_client);
    _spotifyApiRepository = SpotifyApiRepository(_spotifyApiDataSource);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ArtistsStore(_spotifyApiRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme.copyWith(
                  headline2: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  headline4: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ).copyWith(),
        ),
        onGenerateRoute: (settings) => Router.onGenerateRoute(settings),
        initialRoute: SearchScreen.routeName,
      ),
    );
  }
}
