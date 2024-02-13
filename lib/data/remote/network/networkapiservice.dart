import 'package:safe_paws/data/remote/network/baseapiservice.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic response = await http.get(
      Uri.parse(url),
    );
    return response.body;
  }
}
