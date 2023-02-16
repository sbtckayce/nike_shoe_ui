import 'package:flutter/material.dart';
import 'package:shoe_app/models/models.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.nikeModel,
    required this.index,
  }) : super(key: key);
  final NikeModel nikeModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/detail',arguments: nikeModel);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        
        margin: EdgeInsets.only(left: index ==0 ? 0 : 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Stack(
            children: [
              Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFF475269),
                    borderRadius: BorderRadius.circular(10),
                  )),
              Center(
                child: Image.asset(nikeModel.imageUrl, fit: BoxFit.cover,
               ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  nikeModel.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  nikeModel.category,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
