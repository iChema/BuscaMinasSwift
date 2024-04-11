/*
José Alfredo Arriaga Rosillo 76774
Samuel Conde Rangel 77164
Héctor Eduardo Fuentes Pérez 77904 =)
Eliseo Paredes Sánchez - 77648
Ivan Haziel Benito Rodriguez - 77793
Grupo 411
21 de Marzo de 2024
Recrear el codigo del Buscaminas en la consola

9 de abril del 2024
Roger Santos -> 78489
Samuel Conde Rangel -> 77164
*/

var tablero: [[Int]];
var tamañoTablero: Int;
 /* ESTADOS:
 -2 -> No tocada
 -1 -> Bomba
  0 -> No Bomba (Tocada)
  1 -> Bomba Cerca (tocada) */

 var perdiste: Bool = false;
 var coordenadas: String; 

/*
    Crear el Tablero
    In: tamañoTablero
    Out: Tablero
    Objective: Crear el tablero 
    del tamaño que el usuario seleccione 
    (Min 5 X 5)
    Author: Héctor Eduardo Fuentes Pérez
    Id:77904
*/
func crearTablero(_ tamaño:Int){
    tablero = Array(repeating: Array(repeating: -2, count: tamaño), count: tamaño);
}

/*Funcion Crear Bombas
in: tamañoTablero
out: Tablero con bombas
Descripcion: Esta funcion recibe el tamaño del
 tablero y pone esa cantidad de bombas
  (tablero de 5x5) = 5 bombas
  Autor: eliseo Paredes
*/
func crearBombas(_ tamañoTablero: Int){
    var contarBombas:Int = 0;
    while contarBombas < tamañoTablero{
        var filaBomba: Int = Int.random(in: 0..<tamañoTablero);
        var columnaBomba: Int = Int.random(in: 0..<tamañoTablero);
        if(tablero[filaBomba][columnaBomba] != -1){
            tablero[filaBomba][columnaBomba] = -1;
            contarBombas += 1;
        }
    }
}

/*
Funcion para crear tablero
Entradas: void.
Salida: Imprime el tablero.
Descripción: Imprime el tablero.
Creador: Hazie
*/
func mostrarTablero(){
    header();
    for (index, fila) in tablero{
        numeroAEmoji(index);
        for celda in fila{
            switch celda {
                case -2:
                    print("⬜️",terminator:"");
                case -1:
                    if perdiste == true {
                        print("💣",terminator:"");
                    }else {
                        print("⬜️",terminator:"");
                    }
                case 0:
                    print("🔳",terminator:"");
                case 1:
                    print(" 1", terminator:"");
                case 2:
                    print(" 2", terminator:"");
                case 3:
                    print(" 3", terminator:"");
                case 4:
                    print(" 4", terminator:"");
                case 5:
                    print(" 5", terminator:"");
                case 6:
                    print(" 6", terminator:"");
                case 7:
                    print(" 7", terminator:"");
                case 8:
                    print(" 8", terminator:"");
            }
        }
        print(""); 
    }
}

/*
    Función mostrar cabecera
    Entrada: Void.
    Salida: Imprime la cabecera
    Descripcion: Toma los emojis de numeros 
    y los muestra en la cabecera del tablero.
    Autor: Haziel.
*/
func header(){
    var headerText = "";
    var numeros = ["#️⃣ ","1️⃣ ","2️⃣ ","3️⃣ ","4️⃣ ","5️⃣ ","6️⃣ ","7️⃣ ","8️⃣ ","9️⃣ ","🔟 "];
    for i:Int in 0...tamañoTablero{
        headerText += numeros[i];
    }
    print(headerText);
}

/*
Funcion mostrar numero
Entrada: index
Salida: emoji
Descripción: Se da un numero 
y regresa un emoji
Ejemplo:
Entrada: 2
Salida: 2️⃣
*/
func numeroAEmoji(index:Int)->Int{
    let numeros = ["1️⃣ ","2️⃣ ","3️⃣ ","4️⃣ ","5️⃣ ","6️⃣ ","7️⃣ ","8️⃣ ","9️⃣ ","🔟 "];
    print(numeros[index],terminator:"");
}

/*
Función para jugar el buscaminas 
entrada: void
salida: void
descripción: llama a todas las anteriores 
funciones
Autor: Francisco Aboytes Martínez 
Id: 78532
*/
func jugar(){
    print("Bienvenido al buscaminas");
    print("Indique el tamaño del tablero o x para terminar: (Numero Entero X=3)");
    repeat{

        var entrada = readLine()!;
        
    }
    while (entrada != "");
    
    if tamañoTablero = Int (entrada){
        crearTablero(tamañoTablero);
        crearBombas(tamañoTablero);
        print("Ingrese las coordenadas que desea asignar: (1,1)");
        coordenadas = readLine()!;
        obtenerCoordenadas(coordenadas);
    }
    else {
        break
    }
}

/*
Fragmento de coodigo que obitiene las coordenadas 
ingresadas por el usuario
Roger Santos -> 78489
09/04/2024
Recibe: String (coordenadas)
Retorna: Tupla (coor1, coor2)
*/
func obtenerCoordenadas(_ coordenadas:String) -> (coor1:Int , coor2:Int){
    let coordenadas_trans:[] = coordenadas.split(separator:",");
    if coordenadas_trans.count == 2{
        if let coor1 = Int(coordenadas_trans[0]){
            if let coor2 = Int(coordenadas_trans[1]){
                return (coor1, coor2)
            }
        }
        return (nil, nil)
    }
    return (nil, nil)
}

/* FUNCIÓN CHECAR POSICIÓN
   In: x, y
   Out: 
   Objetivo: 
   Autor: Samuel
*/
func checarPosicion(_ x: Int, _ y: Int){
    let coord_x = x - 1;
    let coord_y = y - 1;
    if coord_x < 0 || coord_y < 0
       || coord_x > tamañoTablero 
       || coord_y > tamañoTablero{
        return nil;
    }

    let valorEncontrado = tablero[coord_x][coord_y];
    if valorEncontrado == -1{
        return -1;
    }
    else if valorEncontrado == -2{
        let bombasEncontradas = bombasCercanas(coord_x, coord_y);
        if bombasEncontradas > 0{
            tablero[coord_x][coord_y] = bombasEncontradas;
        }
        else{
            
        }
    }
    else{

    }
}

func bombasCercanas(_ coord_x: Int, _ coord_y: Int){
    let rango_x: [Int] = max(coord_x - 1 , 0)...min(coord_x + 1 , tamañoTablero - 1) 
    let rango_y: [Int] = max(coord_y - 1 , 0)...min(coord_y + 1 , tamañoTablero - 1)
    var contadorMinas = 0;

    for i in rango_x{
        for j in rango_y{
            if i == coord_x && j == coord_y{
                continue
            }
            if tablero[i][j] == -1{
                contadorMinas += 1;
            }
        }
    }
    return contadorMinas;
}

func bombasCercanasRecursiva(_ coord_x: Int, _ coord_y: Int){
    let rango_x: [Int] = max(coord_x - 1 , 0)...min(coord_x + 1 , tamañoTablero - 1) 
    let rango_y: [Int] = max(coord_y - 1 , 0)...min(coord_y + 1 , tamañoTablero - 1)

    for i in rango_x{
        for j in rango_y{
            if i == coord_x && j == coord_y{
                continue
            }
            if tablero[i][j] != -1{
                if bombasCercanas(i, j) > 0{
                    return nil;
                }
                else{
                    bombasCercanasRecursiva(i, j);
                }
            }
        }
    }
    return contadorMinas;
}