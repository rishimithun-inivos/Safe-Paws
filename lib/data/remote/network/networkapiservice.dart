import 'package:safe_paws/data/remote/appExceptions.dart';
import 'package:safe_paws/data/remote/network/baseapiservice.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  late dynamic response;
  late dynamic responseBodyResult;

  responseResult(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 201:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw InvalidRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:
        throw FetchDataException(response.body.toString());
    }
  }

  @override
  Future getGetApiResponse(String url) async {
    try {
      response = await http.get(
        Uri.parse(url),
      );

      responseBodyResult = responseResult(response);

      return responseBodyResult;
    } catch (e) {
      throw 'THIS IS THE ERROR : $e';
    }
  }
}
