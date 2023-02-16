import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoe_app/blocs/cart/cart_bloc.dart';
import 'package:shoe_app/models/nike_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.nikeModel,
  }) : super(key: key);
  final NikeModel nikeModel;
  static const String routeName = '/detail';
  static Route route({required NikeModel nikeModel}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: DetailScreen.routeName),
        builder: (_) => DetailScreen(
              nikeModel: nikeModel,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 230,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Color(0xFF475269),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Image.asset(
                    nikeModel.imageUrl,
                    fit: BoxFit.contain,
                    width: 340,
                    height: 340,
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nikeModel.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$${nikeModel.price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.redAccent),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        allowHalfRating: true,
                        itemBuilder: (context, index) {
                          return Icon(Icons.favorite, color: Colors.redAccent);
                        },
                        onRatingUpdate: (rating) {}),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Size',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Row(
                          children: [
                            for (int i = 5; i < 10; i++)
                              Container(
                                height: 35,
                                width: 35,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF475269),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Text(
                                  i.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                )),
                              )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.white),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CartLoaded) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF475269),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddedCart(nikeModel));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Added to your cart')));
                                },
                                child: Text(
                                  'Add To Cart',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(Icons.shopping_cart)
                            ],
                          ))
                    ]);
              } else {
                return Text('Something went wrong');
              }
            },
          ),
        ),
      ),
    );
  }
}
