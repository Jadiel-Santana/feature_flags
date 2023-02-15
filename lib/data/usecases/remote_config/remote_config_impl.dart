import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteConfigImpl implements RemoteConfigUsecase {
  final AppRemoteConfig config;

  const RemoteConfigImpl({
    required this.config,
  });

  @override
  Future<dynamic> call({
    required String key,
    required dynamic defaultValue,
  }) async {
    try {
      return await config.fetchValue(
        key: key,
        defaultValue: defaultValue,
      );
    } catch (_) {
      throw Exception();
    }
  }
}
