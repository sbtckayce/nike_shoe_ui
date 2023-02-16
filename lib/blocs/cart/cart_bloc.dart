import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoe_app/models/cart_model.dart';
import 'package:shoe_app/models/nike_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<StartCart>((event, emit) async {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(CartLoaded());
    });
    on<AddedCart>((event, emit) {
      if (state is CartLoaded) {
        emit(CartLoaded(
            cartModel: CartModel(
                nikes: List.from((state as CartLoaded).cartModel.nikes)
                  ..add(event.nikeModel))));
      }
    });
    on<RemovedCart>((event, emit) {
      if (state is CartLoaded) {
        emit(CartLoaded(
            cartModel: CartModel(
                nikes: List.from((state as CartLoaded).cartModel.nikes)
                  ..remove(event.nikeModel))));
      }
    });
  }
}
