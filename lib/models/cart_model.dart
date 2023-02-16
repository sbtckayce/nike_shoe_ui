import 'package:equatable/equatable.dart';
import 'package:shoe_app/models/models.dart';

class CartModel extends Equatable {
  final List<NikeModel> nikes;
  const CartModel({this.nikes = const <NikeModel>[]});
  double get subtotal =>
      nikes.fold(0, (total, current) => total + current.price);

  String get subtotalString => subtotal.toStringAsFixed(2);

  double feeDelivery(subtotal) {
    if (subtotal > 50.0) {
      return 0.0;
    } else {
      return 15.0;
    }
  }

  String get feeDeliveryString => feeDelivery(subtotal).toStringAsFixed(2);

  String missingPrice(subtotal) {
    if (subtotal > 50) {
      return '0';
    } else {
      double missing = 50.0 - subtotal;
      return '$missing';
    }
  }

  double total(subtotal, feeDelivery) {
    return subtotal + feeDelivery;
  }

  String get totalString =>
      total(subtotal, feeDelivery(subtotal)).toStringAsFixed(2);
  String get missingPriceString => missingPrice(subtotal).toString();

  Map nikeQuantity(nikes) {
    var quantity = Map();
    nikes.forEach((nike) {
      if (!quantity.containsKey(nike)) {
        quantity[nike] = 1;
      } else {
        quantity[nike] += 1;
      }
    });
    return quantity;
  }

  @override
  List<Object?> get props => [nikes];
}
