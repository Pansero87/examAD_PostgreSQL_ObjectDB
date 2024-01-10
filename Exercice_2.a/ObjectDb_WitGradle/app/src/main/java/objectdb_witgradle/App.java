package objectdb_witgradle;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

public class App {
    public String getGreeting() {

        EntityManagerFactory emf;
        EntityManager em;
        emf = Persistence.createEntityManagerFactory("testBD.odb");

        try {
            em = emf.createEntityManager();
            System.out.println("DB was created");
            em.close();
        } catch (PersistenceException ex) {
            System.out.println(ex.getMessage());
        }

        return "¡Hola mundo!";
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
    }
}
