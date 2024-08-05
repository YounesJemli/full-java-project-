package tn.esprit.rh.achat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import tn.esprit.rh.achat.entities.Produit;
import tn.esprit.rh.achat.services.IProduitService;
@EnableScheduling
@SpringBootApplication
public class AchatApplication {

    public static void main(String[] args) {
        SpringApplication.run(AchatApplication.class, args);
        List<Produit> produits = produitService.retrieveAllProduits();
            
            // Afficher les produits dans la console
            if (produits.isEmpty()) {
                System.out.println("Aucun produit trouvé.");
            } else {
                for (Produit produit : produits) {
                    System.out.println("Produit : " + produit);
                }
            }
    }

}
