# Proyecto en Java con mysql

>- proyecto creado en vscode.
>- proyecto desarrollado en java para realizar consultas a una base de datos en mysql.

## Dependencias

>- [Java JDK 17.0.8](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
>- [mysql connector 8.1.0](https://dev.mysql.com/downloads/connector/j/)

## Folder Structure

The workspace contains two folders by default, where:

- `src`: the folder to maintain sources
- `lib`: the folder to maintain dependencies

Meanwhile, the compiled output files will be generated in the `bin` folder by default.

> If you want to customize the folder structure, open `.vscode/settings.json` and update the related settings there.

## Dependency Management

>- The `JAVA PROJECTS` view allows you to manage your dependencies. More details can be found [here](https://github.com/microsoft/vscode-java-dependency#manage-dependencies).

## Uso
```java
public static void main(String[] args) {
    try {
        // Clase DAO para la Query según el tipo de dato generico asignado
        // ahora la clase DAO tambien se encarga de inicializar la conexión a la base de datos
        QueryDAO<User> miUserDAO = new QueryDAO<User>("users", "consulta", "localhost", "3306", "test_user", "5x5W12");

        // verificar si existen datos y seleccionar 1 para comprobar el nombre
        System.out.println(miUserDAO.ReadAll(builder).get(1).getNombre());

        // Clase que representa el tipo de dato para la clase DAO
        User nuevo = new User(0, "juan", "jl@gmail", "123", "user", null, null);

        //clase Builder del Usuario 
        UserBuilder builder = new UserBuilder();

        //método para registrar datos de la tabla
        nuevo.setCreate_at(); // asigna la fecha actual
        QueryDAO.InsertNewRegister(nuevo, "nombre: " + nuevo.getNombre(), builder);

        // método para actualizar datos de la tabla
        nuevo.setUpdate_at(); // asigna la fecha actual
        QueryDAO.UpdateRegister(nuevo, "nombre: juan, password: 123", builder);

        // método para eliminar los datos de una tabla
        QueryDAO.EliminarRegistro("nombre: juan", builder);
    } catch (Exception e) {
        System.out.println(e);
    }
}
```
