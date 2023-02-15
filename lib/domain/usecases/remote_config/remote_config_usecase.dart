abstract class RemoteConfigUsecase {
  Future<dynamic> call({
    required String key,
    required dynamic defaultValue,
  });
}
