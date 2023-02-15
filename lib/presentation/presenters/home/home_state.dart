import '../../../domain/domain.dart';

abstract class HomeState {
  factory HomeState.initial() = InitialState;
  factory HomeState.loading() = LoadingState;
  factory HomeState.success({required List<ProductEntity> products}) = SuccessState;
  factory HomeState.error({required String message}) = ErrorState;
}

class InitialState implements HomeState {
  InitialState();
}

class LoadingState implements HomeState {
  LoadingState();
}

class SuccessState implements HomeState {
  final List<ProductEntity> products;
  SuccessState({required this.products});
}

class ErrorState implements HomeState {
  final String message;
  ErrorState({required this.message});
}
