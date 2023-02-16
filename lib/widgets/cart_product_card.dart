import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe_app/blocs/cart/cart_bloc.dart';
import 'package:shoe_app/models/nike_model.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
    required this.nikeModel,
    required this.quantity,
  }) : super(key: key);
  final NikeModel nikeModel;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if(state is CartLoading){
          return Center(child: CircularProgressIndicator(),);
        }if(state is CartLoaded){
          return Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 140,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFF475269),
                      borderRadius: BorderRadius.circular(10),
                    )),
                Image.asset(
                  nikeModel.imageUrl,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nikeModel.name, style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartBloc>().add(RemovedCart(nikeModel));
                      },
                      child: Icon(
                        Icons.remove,
                        size: 20,
                      ),
                    ),
                    Text(
                      '${quantity}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    GestureDetector(
                       onTap: () {
                        context.read<CartBloc>().add(AddedCart(nikeModel));
                      },
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ],
                )
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(RemovedCart(nikeModel));
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('\$${nikeModel.price}',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ))
          ]),
        );
        }else{
          return Text('Something went wrong');
        }
      },
    );
  }
}
