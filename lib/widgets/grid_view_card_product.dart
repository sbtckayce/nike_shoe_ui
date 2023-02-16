import 'package:flutter/material.dart';
import 'package:shoe_app/models/nike_model.dart';
import 'package:shoe_app/widgets/widgets.dart';

class GridViewCardProduct extends StatelessWidget {
  const GridViewCardProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: NikeModel.nikes.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.67,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return GridCard(nikeModel: NikeModel.nikes[index],);
      },
    );
  }
}

