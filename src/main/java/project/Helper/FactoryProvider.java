package project.Helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    public static SessionFactory factory;
    public static SessionFactory getFactory(){
        //we will create factory till factory has null
        if (factory == null) {
            Configuration cfg = new Configuration();
            cfg.configure("hibernate.cfg.xml");
            factory = cfg.buildSessionFactory();
        }
        return factory;
    }
    public void closeFactory(){
        if(factory.isOpen()){
            factory.close();
        }
    }
}
