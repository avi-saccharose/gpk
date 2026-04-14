import 'package:gpk_app/core/network/api_server.dart';
import 'package:test/test.dart';

void main() async {
  final apiServer = ApiServer(baseUrl: "https://jsonplaceholder.typicode.com");
  test("successfully fetch and parse request", () async {
    final result = await apiServer.fetch("/posts/1");
    expect(result['id'], 1);
  });
}
