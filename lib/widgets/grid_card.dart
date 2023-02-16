import 'package:flutter/material.dart';
import 'package:shoe_app/models/models.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    Key? key,
    required this.nikeModel,
  }) : super(key: key);
  final NikeModel nikeModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
        Navigator.pushNamed(context, '/detail',arguments: nikeModel);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 10),
        width: MediaQuery.of(context).size.width*0.4,
       
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  nikeModel.imageUrl,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                nikeModel.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                nikeModel.category,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${nikeModel.price}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.redAccent),
                  ),
                  Icon(Icons.shopping_cart)
                ],
              )
            ]),
      ),
    );
  }
}
