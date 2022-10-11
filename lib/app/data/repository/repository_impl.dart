import '../../core/base/base_repository.dart';
import '../../network/dio_provider.dart';
import 'repository.dart';

class RepositoryImpl extends BaseRepository implements Repository {
  @override
  Future<String> login(String idToken) async {
    var endpoint = "${DioProvider.baseUrl}/authorization/login";
    var data = {
      "idToken": idToken,
    };
    var dioCall = dioClient.post(endpoint, queryParameters: data);

    try {
      return callApi(dioCall).then((response) => response.data['body']);
    } catch (e) {
      rethrow;
    }
  }
}
