import 'package:imdbMoviews/containers/brasil_movies/models/movies_viewmodel.dart';

abstract class IBrasilMoviesService {
  Future<List<MoviesViewModel>> getMovies();
}
