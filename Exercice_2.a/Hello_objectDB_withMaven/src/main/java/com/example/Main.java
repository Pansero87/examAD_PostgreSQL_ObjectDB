package com.example;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

public class Main {
    public static void main(String[] args) {

        EntityManagerFactory emf;
        EntityManager em;
        emf = Persistence.createEntityManagerFactory("testBD.odb");

        try {
            em = emf.createEntityManager();
            System.out.println("DB was created");

            // Create a random object
            MusicianODB musician = new MusicianODB();
            musician.setName("Sergio MB");
            musician.setAge(25);
            musician.setNation("USA");
            musician.setInstrument("Guitar");

            // Insert the object into the database
            em.getTransaction().begin();
            em.persist(musician);
            em.getTransaction().commit();

            System.out.println("Object inserted successfully");

            em.close();
        } catch (PersistenceException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Error inserting object into the database");
        }
    }
}