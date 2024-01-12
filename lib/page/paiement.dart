import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Paiement extends StatelessWidget {
  const Paiement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finalisation de la commande"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15.0),
            ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Récapitulatif de votre commande",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Sous-total",
                        style: TextStyle(
                            fontSize: 16.0)
                    ),
                    Text(
                      textAlign: TextAlign.right,
                      "0.00",
                        style: TextStyle(
                            fontSize: 16.0)
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "vous économisez",
                        style: TextStyle(
                            color: Colors.green, // Couleur du texte
                            fontSize: 16.0)
                    ),
                    Text(
                        "0.00",
                        style: TextStyle(
                            color: Colors.green, // Couleur du texte
                            fontSize: 16.0)
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TVA",
                        style: TextStyle(
                            fontSize: 16.0
                        )
                    ),
                    Text(
                      "0.00",
                        style: TextStyle(
                            fontSize: 16.0
                        )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "TOTAL",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold

                        )
                    ),
                    Text(
                        "0.00",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ],
                ),
                ],
              ),
            ),

            const Text(
                textAlign: TextAlign.left,
                "Adresse de livraison",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                )
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15.0),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      "Michel le Poney",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Row(
                    children: [
                      Text(
                          "8 rue des ouvertures de portes",
                          style: TextStyle(
                              fontSize: 16.0)
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                          "93204 Corbeaux",
                          style: TextStyle(
                              fontSize: 16.0
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Spacer(),
            const Text(
                "En cliquant sur \"Confirmer l'achat\" vous acceptez les conditions de ventes d'EPSI Shop International. Besoin d'aide ? Désolé on ne peut rien faire.",
                style: TextStyle(
                    fontSize: 12.0
                )
            ),
            const Text(
                "En poursuivant vous acceptez les conditions d'utilisation du fournisseur du paiement CoffeeDis",
                style: TextStyle(
                    fontSize: 12.0
                )
            ),
            ElevatedButton(
                child: const Text("Confirmer l'achat"),
                onPressed: ()=> context.go("/validation"),
            )
          ],
        ),
      ),
    );
  }
}
