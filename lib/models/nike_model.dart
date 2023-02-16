import 'package:equatable/equatable.dart';

class NikeModel extends Equatable{
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final int quantity;
  NikeModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
  
  

  static List<NikeModel> nikes = [
    NikeModel(
        id: '1',
        name: 'Nike Shoe 1',
        category: 'Men\'s Show',
        imageUrl: 'assets/images/1.png',
        price: 40.0,
        quantity: 10),
    NikeModel(
        id: '2',
        name: 'Nike Shoe 2',
        category: 'Men\'s Show',
        imageUrl: 'assets/images/2.png',
        price: 20.0,
        quantity: 11),
    NikeModel(
        id: '3',
        name: 'Nike Shoe 3',
        category: 'Men\'s Show',
        imageUrl: 'assets/images/3.png',
        price: 60.0,
        quantity: 12),
    NikeModel(
        id: '4',
        name: 'Nike Shoe 4',
        category: 'Men\'s Show',
        imageUrl: 'assets/images/4.png',
        price: 10.0,
        quantity: 13),
  ];
  
  @override
  
  List<Object?> get props => [
    id,name,category,imageUrl,price,quantity
  ];
}
