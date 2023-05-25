import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heythereproject/containers/brasil_movies/models/movies_viewmodel.dart';
import '../bloc/brasil_movies_cubit.dart';
import '../bloc/brasil_movies_model.dart';

class BrasilRecentMoviesScreen extends StatelessWidget {
  static String ROUTE = "/brasil_recent_movies-screen";

  BrasilMoviesCubit _bloc = BrasilMoviesCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _bloc.getMovieList();
        _bloc = _bloc;
        return _bloc;
      },
      child: RefreshIndicator(
        strokeWidth: 3,
        color: const Color(0xff2BBAB4),
        onRefresh: () => _bloc.onRefresh(),
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      elevation: 0.3,
      backgroundColor: Color(0xff2BBAB4),
      title: const Text(
        "IMBD",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<BrasilMoviesCubit, BrasilMoviesModel>(
        builder: (context, state) {
      if (state.moviesList.isEmpty) {
        return const Center(
            child: CircularProgressIndicator(color: Color(0xff2BBAB4)));
      }
      return ListView(
        padding: const EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        children: [
          const Text('10 Filmes brasileiros mais recentes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff2BBAB4),
                fontWeight: FontWeight.bold,
              )),
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                MoviesViewModel item = state.moviesList[index];

                return InkWell(
                  onTap: () {
                    _bloc.ontapMovieItem(item);
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              margin: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: NetworkImage(item.urlImage),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff3C3261),
                                      blurRadius: 5.0,
                                      offset: new Offset(2.0, 5.0))
                                ],
                              ),
                              child: Container(
                                width: 70.0,
                                height: 70.0,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.title,

                                      style: const TextStyle(overflow: TextOverflow.ellipsis,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff3C3261)),
                                    ),
                                    Icon(!state.moviesList[index].liked
                                        ? Icons.star_border
                                        : Icons.star),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.all(2.0)),
                                Text(
                                  item.plot,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    color: Color(0xff8785A4),
                                  ),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                      Container(
                        width: 300.0,
                        height: 0.5,
                        color: const Color(0xD2D2E1ff),
                        margin: const EdgeInsets.all(16.0),
                      )
                    ],
                  ),
                );
              }),
        ],
      );
    });
  }
}
