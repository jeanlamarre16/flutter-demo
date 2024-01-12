import 'package:flutter/cupertino.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Récapitulatif de votre commande",
                    style: TextStyle(
                      fontSize: 24.0
                    )
                ),
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.right,
                        "125",
                          style: TextStyle(
                              color: Colors.green, // Couleur du texte
                              fontSize: 24.0)
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "Sous-total",
                          style: TextStyle(
                          fontSize: 24.0)
                      ),
                      Text(
                        "vous économisez",
                          style: TextStyle(
                              color: Colors.green, // Couleur du texte
                              fontSize: 24.0)
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "TVA",
                          style: TextStyle(
                              fontSize: 24.0
                          )
                      ),
                      Text(
                        "Total",
                          style: TextStyle(
                              fontSize: 24.0
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            const Spacer(),
            ElevatedButton(
                child: Text("Confirmer l'achat"),
                onPressed: ()=> context.go("/validation"),
            )
          ],
        ),
      ),
    );
  }
}
