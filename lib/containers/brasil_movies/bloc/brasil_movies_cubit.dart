import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heythereproject/containers/brasil_movies/bloc/brasil_movies_actions.dart';
import 'package:heythereproject/containers/brasil_movies/bloc/brasil_movies_model.dart';
import 'package:heythereproject/containers/brasil_movies/models/movies_viewmodel.dart';
import 'package:injector/injector.dart';
import 'package:heythereproject/api/brasil_movies_service/i_brasil_movies_service.dart';



class BrasilMoviesCubit extends Cubit<BrasilMoviesModel> implements BrasilMoviesAction {
  BrasilMoviesCubit() : super(BrasilMoviesModel(moviesList: []));





   final IBrasilMoviesService _cadastroContaService =  Injector.appInstance.get<IBrasilMoviesService>();

   bool consulted = false;



  @override
  Future<void> getMovieList() async {
    if(!consulted){
      List<MoviesViewModel> listaDeFilmesTemporaria =[];
      List<MoviesViewModel> get = await  _cadastroContaService.getMovies();
      if(get.isNotEmpty){
        consulted = true;
        listaDeFilmesTemporaria = get;
         state.moviesList = listaDeFilmesTemporaria;
      }
      emit(state.patchState(moviesList:state.moviesList));
    }
  }

  Future<void> onRefresh()async{
    consulted = false;
    await getMovieList();

  }

  void ontapMovieItem(MoviesViewModel item){
    item.liked = true;
    emit(state.patchState(moviesList:state.moviesList));
  }



}
