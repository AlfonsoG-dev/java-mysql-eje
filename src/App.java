import Conexion.*;
//import Mundo.User;
public class App {
    public static void main(String[] args) {
        try {
            UserDAO miUserDAO = new UserDAO();
            System.out.println(miUserDAO.ReadAll()[0].GetAllProperties());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
