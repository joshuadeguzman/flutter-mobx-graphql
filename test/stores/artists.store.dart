import 'package:either_option/either_option.dart';
import 'package:flutter_mobx_graphql/errors/failures.dart';
import 'package:flutter_mobx_graphql/models/models.dart';
import 'package:flutter_mobx_graphql/repositories/spotify_api_repository.dart';
import 'package:flutter_mobx_graphql/screens/artists/stores/artists.store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSpotifyApiRepository extends Mock implements ISpotifyApiRepository {}

void main() {
  MockSpotifyApiRepository _repository;
  ArtistsStore _store;

  setUp(() {
    _repository = MockSpotifyApiRepository();
    _store = ArtistsStore(_repository);
  });

  group(
    'searchArtists',
    () {
      test(
        "should SET the [errorMessage] when the repository returns a [Failure]",
        () {
          // Arrange
          final name = "Carpenters";
          when(_repository.getArtists(name)).thenAnswer(
            (_) async => Left(NoResultsFoundFailure()),
          );

          // Act
          _store.searchArtists(name);

          // Assert
          expect(_store.errorMessage, "No results found.");
        },
      );

      test(
        "should SET the [artistsResult] when the repository returns the results",
        () {
          // Arrange
          final name = "Carpenters";
          final result = [
            Artist(name: "The Carpenters"),
            Artist(name: "Carpenters"),
          ];
          when(_repository.getArtists(name)).thenAnswer(
            (_) async => Right(result),
          );

          // Act
          _store.searchArtists(name);

          // Assert
          expect(_store.artistsResult, result);
          expect(_store.artistsResult.length, 2);
          expect(_store.artistsResult.first.name, result.first.name);
        },
      );
    },
  );
}
