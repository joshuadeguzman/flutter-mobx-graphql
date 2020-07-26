import 'package:flutter/material.dart';
import 'package:flutter_mobx_graphql/screens/artists/artists.screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search-screen";

  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _queryController;

  @override
  void initState() {
    _queryController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search Artists",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade800,
                        ),
                        child: TextField(
                          controller: _queryController,
                          decoration: InputDecoration(
                            hintText: "Search artist",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          child: InkWell(
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onTap: () {
                              if (_queryController.text.length > 0) {
                                Navigator.pushNamed(
                                  context,
                                  ArtistsScreen.routeName,
                                  arguments: ArtistsScreenArgs(
                                    _queryController.text,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 36),
                  child: Text(
                    "Top Artists",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: Image.asset("assets/images/full_of_dreams.jpeg"),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),
                        child: Image.asset("assets/images/lover.png"),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),
                        child: Image.asset("assets/images/know.jpg"),
                      ),
                      Container(
                        margin: const EdgeInsets.all(4),
                        child: Image.asset("assets/images/jukebox.jpeg"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
