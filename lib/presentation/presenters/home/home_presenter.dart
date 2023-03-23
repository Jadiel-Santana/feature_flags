import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../domain/domain.dart';
import '../presenters.dart';

class ProductsPresenter extends ValueNotifier<HomeState> {
  final FetchProductsUsecase fetchProductsUsecase;
  final RemoteConfigUsecase remoteConfigUsecase;

  ProductsPresenter({
    required this.fetchProductsUsecase,
    required this.remoteConfigUsecase,
  }) : super(HomeState.initial());

  Future<void> fetchProducts() async {
    try {
      value = HomeState.loading();
      List<ProductEntity> products = await fetchProductsUsecase();
      value = HomeState.success(products: products);
    } catch (e) {
      value = HomeState.error(message: e.toString());
    }
  }

  Future<dynamic> getValueRemoteConfig({
    required String key,
    required dynamic defaultValue,
  }) async {
    return await remoteConfigUsecase(
      key: key,
      defaultValue: defaultValue,
    );
  }

  Future<bool> checkVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    int appVersion = int.parse(packageInfo.version.replaceAll('.', ''));

    String version = await getValueRemoteConfig(
      key: 'current_version',
      defaultValue: packageInfo.version,
    );
    int firebaseVersion = int.parse(version.replaceAll('.', ''));

    return (firebaseVersion > appVersion);
  }
}
