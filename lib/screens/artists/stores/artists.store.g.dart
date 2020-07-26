// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArtistsStore on _ArtistsStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_ArtistsStore.state'))
      .value;

  final _$_artistsFutureAtom = Atom(name: '_ArtistsStore._artistsFuture');

  @override
  ObservableFuture<Either<Failure, List<Artist>>> get _artistsFuture {
    _$_artistsFutureAtom.reportRead();
    return super._artistsFuture;
  }

  @override
  set _artistsFuture(ObservableFuture<Either<Failure, List<Artist>>> value) {
    _$_artistsFutureAtom.reportWrite(value, super._artistsFuture, () {
      super._artistsFuture = value;
    });
  }

  final _$artistsResultAtom = Atom(name: '_ArtistsStore.artistsResult');

  @override
  List<Artist> get artistsResult {
    _$artistsResultAtom.reportRead();
    return super.artistsResult;
  }

  @override
  set artistsResult(List<Artist> value) {
    _$artistsResultAtom.reportWrite(value, super.artistsResult, () {
      super.artistsResult = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ArtistsStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$searchArtistsAsyncAction = AsyncAction('_ArtistsStore.searchArtists');

  @override
  Future searchArtists(String name) {
    return _$searchArtistsAsyncAction.run(() => super.searchArtists(name));
  }

  final _$_ArtistsStoreActionController =
      ActionController(name: '_ArtistsStore');

  @override
  dynamic reset() {
    final _$actionInfo = _$_ArtistsStoreActionController.startAction(
        name: '_ArtistsStore.reset');
    try {
      return super.reset();
    } finally {
      _$_ArtistsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic init() {
    final _$actionInfo =
        _$_ArtistsStoreActionController.startAction(name: '_ArtistsStore.init');
    try {
      return super.init();
    } finally {
      _$_ArtistsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
artistsResult: ${artistsResult},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
