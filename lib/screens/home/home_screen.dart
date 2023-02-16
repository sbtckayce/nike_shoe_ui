import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe_app/blocs/cart/cart_bloc.dart';
import 'package:shoe_app/models/nike_model.dart';
import 'package:shoe_app/widgets/widgets.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: HomeScreen.routeName),
        builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.sort,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: const badges.Badge(
                        badgeContent: Text(
                          '1',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: Icon(Icons.notifications),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SearchBar(),
              const SizedBox(
                height: 10,
              ),
              const ListViewCardProduct(),
              const SizedBox(
                height: 10,
              ),
              const GridViewCardProduct(),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFF475269),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.category_outlined,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showSlidingBottomSheet(
                        context,
                        builder: (context) {
                          return SlidingSheetDialog(
                            elevation: 8,
                            cornerRadius: 16,
                            builder: (context, slistate) {
                              return Container(
                                height: 600,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Color(0xFFCEDDEE),
                                ),
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    BlocBuilder<CartBloc, CartState>(
                                      builder: (context, state) {
                                        if (state is CartLoading) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        if (state is CartLoaded) {
                                          return SizedBox(
                                            height: 400,
                                            child: ListView.builder(
                                              itemCount:
                                                  state.cartModel.nikeQuantity(state.cartModel.nikes).keys.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: CartProductCard(
                                                    nikeModel: state.cartModel
                                                        .nikeQuantity(state
                                                            .cartModel.nikes)
                                                        .keys
                                                        .elementAt(index),
                                                    quantity: state.cartModel
                                                        .nikeQuantity(state
                                                            .cartModel.nikes)
                                                        .values
                                                        .elementAt(index),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Text('Something went wrong');
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CartSummary()
                                  ],
                                )),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                    ),
                  )
                ]),
          )),
    );
  }
}
