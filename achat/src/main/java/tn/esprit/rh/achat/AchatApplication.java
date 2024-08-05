import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import tn.esprit.rh.achat.entities.Produit;
import tn.esprit.rh.achat.services.IProduitService;

import java.util.List;

@SpringBootApplication
public class AchatApplication {

    private final IProduitService produitService;

    @Autowired
    public AchatApplication(IProduitService produitService) {
        this.produitService = produitService;
    }

    public static void main(String[] args) {
        SpringApplication.run(AchatApplication.class, args);
    }

    @Bean
    public CommandLineRunner run() {
        return args -> {
            // Récupérer tous les produits
            List<Produit> produits = produitService.retrieveAllProduits();

            // Afficher les produits dans la console
            if (produits.isEmpty()) {
                System.out.println("Aucun produit trouvé.");
            } else {
                for (Produit produit : produits) {
                    System.out.println("Produit : " + produit);
                }
            }
        };
    }
}
