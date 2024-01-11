import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../bo/article.dart';
import '../bo/cart.dart';
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final listArticles = <Article>[
    Article(
        nom: "MBP",
        description: "Ordinateur LowCost",
        categorie: "Ordinateur Accessible",
        image:
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp16-spaceblack-select-202310?wid=904&hei=840&fmt=jpeg&qlt=95&.v=1697311054290",
        prix: 424900),
    Article(
        nom: "MBP 18",
        description: "Ordinateur LowCost",
        categorie: "Ordinateur Accessible",
        image:
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp16-spaceblack-select-202310?wid=904&hei=840&fmt=jpeg&qlt=95&.v=1697311054290",
        prix: 494900),
    Article(
        nom: "Dell XPS",
        description:
        "Ordinateur Un peu plus low cost Ordinateur Un peu plus low cost v vOrdinateur Un peu plus low costOrdinateur Un peu plus low costvvOrdinateur Un peu plus low costvOrdinateur Un peu plus low costOrdinateur Un peu plus low costOrdinateur Un peu plus low costOrdinateur Un peu plus low costOrdinateur Un peu plus low costOrdinateur Un peu plus low costOrdinateur Un peu plus low costOrdinateur Un peu plus low costOrdinateur Un peu plus low costOrdinateur Un peu plus low cost ",
        categorie: "Ordinateur Accessible",
        image:
        "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/xps-notebooks/xps-15-9530/media-gallery/touch-black/notebook-xps-15-9530-t-black-gallery-1.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=654&qlt=100,1&resMode=sharp2&size=654,402&chrss=full",
        prix: 244900),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.go('/cart'),
              icon: Badge(
                //On affiche un badge par dessus l'icône avec le nombre d'articles
                // dans le panier
                  label: Text("${context.read<Cart>().listArticles.length}"),
                  child: Icon(Icons.shopping_cart))
          ),
          IconButton(
              onPressed: ()=> context.go("/aboutus"),
              icon: Icon(Icons.info_outline)
          )
        ],
      ),
      body: FutureBuilder(
              future: fetchListProducts(),
              builder: (context, snapshot) =>
              switch(snapshot.connectionState) {
                ConnectionState.done when snapshot.data != null =>
                    ListArticles(listArticles: snapshot.data!),
                ConnectionState.waiting => CircularProgressIndicator(),
                _ => Icon(Icons.error)
              }),
    );
  }

  // Fonction de récupération des données de l'api
  Future<List<Article>> fetchListProducts() async {
    String uri = "https://fakestoreapi.com/products";
    Response responseListArticle = await get(Uri.parse(uri));
    if(responseListArticle.statusCode == 200 && responseListArticle.body.isNotEmpty) {
        final resultListMap = jsonDecode(responseListArticle.body) as List<dynamic>;
        return resultListMap.map<Article>((map)=>
          Article.fromMap(map)).toList();
    } else {
        throw Exception ("requête invalide");
    }
  }
}

class ListArticles extends StatelessWidget {
  const ListArticles({
    super.key,
    required this.listArticles,
  });

  final List<Article> listArticles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listArticles.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () => context.go("/detail", extra: listArticles[index]),
          title: Text(listArticles[index].nom),
          subtitle: Text(listArticles[index].getPrixEuro()),
          leading: Image.network(
            listArticles[index].image,
            width: 80,
          ),
          trailing: TextButton(
            child: Text("AJOUTER"),
            onPressed: () {
              context.read<Cart>().add(listArticles[index]);
            },
          ),
        ));
  }
}