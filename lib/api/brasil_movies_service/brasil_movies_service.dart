import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:heythereproject/containers/brasil_movies/models/movies_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'package:heythereproject/api/brasil_movies_service/i_brasil_movies_service.dart';

class BrasilMoviesService extends Service implements IBrasilMoviesService {
  BrasilMoviesService() : super();

  static final String BASEURL =
      "https://imdb-api.com/API/AdvancedSearch/k_015u0ki2? title_type=tv_movie&release_date=2023-01-01,2023-31-12&countries=br&languages=pt";

  @override
  Future<List<MoviesViewModel>> getMovies() async {
    Map<String, String> headers = HashMap<String, String>();
    headers = {};
    headers[HttpHeaders.contentTypeHeader] = "application/json";
    try {
      var url = BASEURL;
      var response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 14));

      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        List<MoviesViewModel> dataIndiqueGanhe = (decoded["results"] as List)
            .map<MoviesViewModel>((e) => MoviesViewModel.fromJson(e))
            .toList();
        return dataIndiqueGanhe;
      } else {
        return <MoviesViewModel>[];
      }
    } catch (e) {
      return <MoviesViewModel>[];
    }
  }
}
