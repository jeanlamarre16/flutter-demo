import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/article.dart';
import '../bo/cart.dart';
import 'cart_page.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key, required Article article});

  //Article article = article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail de l'article "),
        ),
        body: Consumer<Cart>(builder: (BuildContext context, Cart value, Widget? child) {
          return const Text("nom de l'article");
        },
        ));
  }
}

