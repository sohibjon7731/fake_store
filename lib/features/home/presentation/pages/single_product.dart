import 'package:fake_store/features/home/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleProductPage extends StatelessWidget {
  final ProductEntity product;

  const SingleProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 70,
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(product.title, maxLines: 1 ,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black),),
                
                background: Image.network(product.image),
              ),
            )
          ];
                },
                body: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              product.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Price: \$${product.prize}',
              
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
                ),
              ),
        ));
  }
}
