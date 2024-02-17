import 'dart:convert';

import 'package:safe_paws/data/remote/apis/api_constants.dart';
import 'package:safe_paws/data/remote/network/baseapiservice.dart';
import 'package:safe_paws/data/remote/network/networkapiservice.dart';
import 'package:safe_paws/model/dog_image_model.dart';

class DogImageRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<DogImageList> fetchDogImageApi() async {
    dynamic repositoryResponse = await _apiService
        .getGetApiResponse(ApiCalls.dogApiBaseUrl + '/api/breeds/image/random/3');
    dynamic decodedRepositoryResponse = jsonDecode(repositoryResponse);
    repositoryResponse = DogImageList.fromJson(decodedRepositoryResponse);
    return repositoryResponse;

  }
}
