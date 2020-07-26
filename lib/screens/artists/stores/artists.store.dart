import 'package:either_option/either_option.dart';
import 'package:flutter_mobx_graphql/errors/failures.dart';
import 'package:flutter_mobx_graphql/models/models.dart';
import 'package:flutter_mobx_graphql/repositories/spotify_api_repository.dart';
import 'package:flutter_mobx_graphql/states.dart';
import 'package:mobx/mobx.dart';

part 'artists.store.g.dart';

class ArtistsStore extends _ArtistsStore with _$ArtistsStore {
  ArtistsStore(ISpotifyApiRepository repository) : super(repository);
}

abstract class _ArtistsStore with Store {
  _ArtistsStore(this._repository) {
    this.init();
  }

  final ISpotifyApiRepository _repository;

  /// By default, a [Store] doesn't have a equivalent [reset] function
  /// To re-initialize its state
  @action
  reset() {
    this.init();
  }

  @action
  init() {
    _artistsFuture = null;
    artistsResult = null;
    errorMessage = null;
  }

  /// Private value that returns the [Either] type result
  @observable
  ObservableFuture<Either<Failure, List<Artist>>> _artistsFuture;

  /// Evaluated result value that is observed in the UI to display list of artists
  @observable
  List<Artist> artistsResult;

  /// Optional error message shown that is observed and presented in the UI
  @observable
  String errorMessage;

  /// Notifies the UI what should be the [state] of the screen
  /// whenever an API call is invoked or returned a result
  @computed
  StoreState get state {
    if (_artistsFuture != null &&
        _artistsFuture.status == FutureStatus.pending) {
      return StoreState.loading;
    } else if (artistsResult == null) {
      return StoreState.initial;
    }

    return StoreState.loaded;
  }

  @action
  searchArtists(String name) async {
    _artistsFuture = ObservableFuture(_repository.getArtists(name));

    final either = await _artistsFuture;

    artistsResult = either.fold(
      (l) {
        this.reset();
        errorMessage = l.message;
        return null;
      },
      (r) => r,
    );
  }
}
