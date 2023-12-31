#list of the clases of the proyect
$Clases = " ./src/*.java ./src/Conexion/*.java ./src/Conexion/Migration/*.java ./src/Conexion/Query/*.java ./src/Config/*.java ./src/Model/*.java ./src/Mundo/*.java ./src/Mundo/Users/*.java ./src/Mundo/Cuentas/*.java ./src/Utils/*.java"

#create .class file in bin for the jvm
$Compilation = "javac -d ./bin/ -cp" + ' ".\lib\mysql-connector-j-8.1.0\mysql-connector-j-8.1.0.jar"' + "$Clases";
#run the program 
$javaCommand = "java -cp " + '"./bin;./lib/mysql-connector-j-8.1.0/mysql-connector-j-8.1.0.jar" .\src\App.java';
#create jar file from bin and lib if lib have dependencies
$CreateJarFile = "md test-jar_extraction && Copy-Item -Path .\lib\mysql-connector-j-8.1.0\mysql-connector-j-8.1.0.jar -Destination .\test-jar_extraction\ && cd .\test-jar_extraction\ && jar -xf .\mysql-connector-j-8.1.0.jar && rm -r .\mysql-connector-j-8.1.0.jar && cd .. && jar -cfm test.jar Manifesto.txt -C bin . -C test-jar_extraction . && rm -r ./test-jar_extraction/"

$runCommand = "$Compilation" + " && " + "$javaCommand" + " &&" + "$CreateJarFile"

Invoke-Expression $runCommand
