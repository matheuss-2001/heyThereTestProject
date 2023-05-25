import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdbMoviews/containers/brasil_movies/bloc/brasil_movies_actions.dart';
import 'package:imdbMoviews/containers/brasil_movies/bloc/brasil_movies_model.dart';
import 'package:imdbMoviews/containers/brasil_movies/models/movies_viewmodel.dart';
import 'package:injector/injector.dart';
import 'package:imdbMoviews/api/brasil_movies_service/i_brasil_movies_service.dart';

class BrasilMoviesCubit extends Cubit<BrasilMoviesModel>
    implements BrasilMoviesAction {
  BrasilMoviesCubit() : super(BrasilMoviesModel(moviesList: []));

  final IBrasilMoviesService _cadastroContaService =
      Injector.appInstance.get<IBrasilMoviesService>();

  bool consulted = false;
  List<MoviesViewModel> listaDeFilmesBloc = [];

  @override
  Future<void> getMovieList() async {
    if (!consulted) {
      listaDeFilmesBloc = [];
      listaDeFilmesBloc = await _cadastroContaService.getMovies();
      if (listaDeFilmesBloc.isNotEmpty) {
        consulted = true;
        emit(state.patchState(moviesList: listaDeFilmesBloc));
      }
    }
  }

  Future<void> onRefresh() async {
    consulted = false;
    await getMovieList();
  }

  void ontapMovieItem(List<MoviesViewModel> itens, int index) {
    if (!itens[index].liked) {
      itens[index].liked = true;
    } else {
      itens[index].liked = false;
    }
    emit(state.patchState(moviesList: itens));
  }
}
