import 'package:flutter_mobx_graphql/models/models.dart';
import 'package:graphql/client.dart';

abstract class ISpotifyApiDataSource {
  Future<List<Artist>> getArtists(String name);
}

class SpotifyApiDataSource implements ISpotifyApiDataSource {
  SpotifyApiDataSource(this._client);

  final GraphQLClient _client;

  @override
  Future<List<Artist>> getArtists(String name) async {
    try {
      const String query = r'''
        query getArtists($name: String!) {
            queryArtists(byName: $name) {
                name
                id
                image
                albums {
                  id
                  name
                }
            }
        }
      ''';

      final response = await _client.query(
        QueryOptions(
          documentNode: gql(query),
          variables: {
            'name': name,
          },
        ),
      );

      if (response.hasException) {
        throw response.exception;
      }

      final data = Data.fromJson(response.data);
      return data.queryArtists;
    } catch (e) {
      throw e;
    }
  }
}
