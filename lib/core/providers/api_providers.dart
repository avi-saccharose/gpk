import 'package:gpk_app/core/network/api_server.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_providers.g.dart';

@Riverpod(keepAlive: true)
ApiServer apiClient(Ref ref) {
  return ApiServer(baseUrl: "http://localhost:8787");
}
