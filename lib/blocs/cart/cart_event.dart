part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartCart extends CartEvent {
  @override
  List<Object?> get props => [];
}

class AddedCart extends CartEvent {
  final NikeModel nikeModel;
  AddedCart(this.nikeModel);
  @override
  List<Object?> get props => [NikeModel];
}

class RemovedCart extends CartEvent {
  final NikeModel nikeModel;
  RemovedCart(this.nikeModel);
  @override
  List<Object?> get props => [NikeModel];
}
