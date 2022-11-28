

import 'package:netflix/api_services/api_key.dart';

const kBaseUrl = "https://api.themoviedb.org/3";

class ApiEndPoints{

 static const downloads = "$kBaseUrl/trending/movie/day?api_key=$apiKey";

 static const search = "$kBaseUrl/search/movie?api_key=$apiKey";

 static const hotAndNewMovie = "$kBaseUrl/discover/movie?api_key=$apiKey";

 static const hotAndNewTv = '$kBaseUrl/discover/tv?api_key=$apiKey';


}