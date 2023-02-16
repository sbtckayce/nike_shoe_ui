import 'package:flutter/material.dart';
import 'package:shoe_app/models/models.dart';
import 'package:shoe_app/widgets/widgets.dart';

class ListViewCardProduct extends StatelessWidget {
  const ListViewCardProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: NikeModel.nikes.length,
        itemBuilder: (context, index) {
          return CardProduct(nikeModel: NikeModel.nikes[index],index: index,);
        },
      ),
    );
  }
}