import 'package:imdbMoviews/containers/brasil_movies/models/movies_viewmodel.dart';

class BrasilMoviesModel {
  List<MoviesViewModel> moviesList;

  BrasilMoviesModel({
    required this.moviesList,
  });

  BrasilMoviesModel patchState({
    required List<MoviesViewModel> moviesList,
  }) {
    return BrasilMoviesModel(
      moviesList: moviesList,
    );
  }
}
