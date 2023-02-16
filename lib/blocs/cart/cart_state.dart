part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  CartState();
  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final CartModel cartModel;
  CartLoaded({this.cartModel = const CartModel()});
  @override
  List<Object?> get props => [cartModel];
}

class CartError extends CartState {
  @override
  List<Object?> get props => [];
}
