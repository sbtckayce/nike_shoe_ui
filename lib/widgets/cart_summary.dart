import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe_app/blocs/cart/cart_bloc.dart';
import 'package:shoe_app/models/models.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if(state is CartLoading){
          return Center(child: CircularProgressIndicator(),);

        }if(state is CartLoaded){return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                    'You can add \$${state.cartModel.missingPriceString} for free ',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall,
                  ),
                const  SizedBox(height: 10,),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                   
                  Text(
                    'Delivery Fee : ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  Text(
                    '\$${state.cartModel.feeDeliveryString}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  )
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub-Total : ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  Text(
                    '\$${state.cartModel.subtotalString}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  )
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  Text(
                    '-\$0',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                            color:
                                Colors.redAccent),
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total : ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  Text(
                    '\$${state.cartModel.totalString}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge,
                  )
                ],
              ),
            ],
          ),
        );}else{
          return Text('Something text went wrong');
        }
      },
    );
  }
}
