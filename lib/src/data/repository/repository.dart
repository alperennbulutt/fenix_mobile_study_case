import 'package:fenix_mobile_study_case/src/data/provider/api.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({required this.apiClient});

  searchMovie(String movieName) {
    return apiClient.searchMovie(movieName);
  }
}
