import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_graphql/screens/artists/stores/artists.store.dart';
import 'package:flutter_mobx_graphql/screens/artists/widgets/artists_list.dart';
import 'package:flutter_mobx_graphql/states.dart';
import 'package:provider/provider.dart';

class ArtistsScreenArgs {
  final String name;

  ArtistsScreenArgs(this.name);
}

class ArtistsScreen extends StatefulWidget {
  static const String routeName = "/artists-screen";
  final String name;

  const ArtistsScreen({Key key, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ArtistsScreenState();
  }
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  String get _name => widget.name;
  ArtistsStore _store;

  @override
  void didChangeDependencies() {
    _store ??= Provider.of<ArtistsStore>(context);
    _store.searchArtists(_name);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _store?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                    Text(
                      "Results for \"$_name\"",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  switch (_store.state) {
                    case StoreState.loading:
                      return Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Searching...",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      );
                    default:
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: ArtistsList(
                              artists: _store.artistsResult ?? [],
                            ),
                          ),
                        ),
                      );
                  }
                },
              ),
              Observer(
                builder: (_) => Visibility(
                  visible: _store.errorMessage != null,
                  child: Expanded(
                    child: Center(
                      child: Text(
                        _store.errorMessage ?? "",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
