

      # def aprobados
      #   data.each do |line|
      #       arreglo = line.split(', ')
      #       nombre = arreglo[0]
      #     suma_notas = arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i
      #     numero_de_notas = (arreglo.length - 1).to_f 
      #     promedio = suma_notas / numero_de_notas
      #       if promedio.to_i >5
      #         puts "alumno #{nombre} aprobado con nota #{promedio}"
      #       end
      #   end
      # end
      # def archivo
      #     file = File.open('datos.csv', 'r') #archivo que estoy leyendo
      #     data = file.readlines
      #     file.close
      #     data.each do |line|
      #       arreglo = line.split(', ')
      #       nombre = arreglo[0]
      #     end
      # end
      def menu
      puts " 
           1) Nombre de cada alumno y promedio notas
           2) Inasistencias totales
           3) Alumnos aprobados
           4) Salir
           " 
       end
menu
##
continuar = true
while continuar
    opcion = gets
    if opcion.to_i == 1 #Debe generar un archivo con el nombre de cada alumno y el promedio de sus notas.
          file = File.open('datos.csv', 'r') #archivo que estoy leyendo
          data = file.readlines
          file.close
          arreglo_acum = []
          data.each do |line|
            arreglo = line.split(', ')
            nombre = arreglo[0]
            suma_notas = arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i
            numero_de_notas = (arreglo.length - 1).to_f 
            promedio = suma_notas / numero_de_notas
            arreglo_nombre_promedio = [nombre, promedio]
            arreglo_acum.push(arreglo_nombre_promedio) #push agrega un elemento en el ultimo espacio
              file = File.open('nombre_promedio.txt', 'w') #nuevo archivo
              file.print arreglo_acum
              file.close
          end
    end
    menu
    #no lo debes de llamar porque se visualizara mas veces de las requeridas
    #y el usuario no entenderá nada
##
    if opcion.to_i == 2 
##archivo #metodo que abre el archivo
        file = File.open('datos.csv', 'r') #archivo que estoy leyendo
          data = file.readlines
          file.close
          data.each do |line|
            arreglo = line.split(', ')
            nombre = arreglo[0]
          end
##
          data.each do |line|
            arreglo = line.split(', ')
            nombre = arreglo[0]
            arreglo_ausentes = (arreglo[1..5]).to_i.select {|num| num = 0 }
            #correccion:
            #El arreglo es:
            #arreglo = juan, 3, 2, 6 por ejemplo, to quieres pasar a entero una cosa
            #que es un conjunto de cosas y el metodo .to_i funciona por elemento, no
            #por conjunto
            #si imprimes arreglo_ausentes te daras cuenta que solo aparece una linea,
            #entonces tendrias que repetir cada linea para obtener el total(hacer un each por ej)
            #otra cosa si lo imprimes te da varios arreglos, 
            #pero en ningun momento sumas los datos
            #ademas ahi colocas que sea igual a cero, la unica forma es pasar a entero,
            #pero ahi debiera de ser por cada elemento(no olvidar iterar)
##############################################################################################

            # En teoría deberia de recorrer el arreglo seleccionando los que son 0, 
            # pasando letras => 0 y los números los deja como números
            # y metiendolos en un arreglo...pero no entiendo porque no funciona :(
            numero_ausentes = (arreglo_ausentes)
            #correccion:
            #el numero de ausentes es el largo total, aun cambiando lo anterior no cuenta el numero de
            #ausencias del arreglo, no es relevante saber el largo a menos que te pidan el promedio
            #independiente de 
            arreglo_nombre_ausente = [nombre, numero_ausentes]
            #puts arreglo_nombre_ausente
          end
    end
    menu
##
    if opcion.to_i == 3 
#archivo #metodo que abre el archivo
         file = File.open('datos.csv', 'r') #archivo que estoy leyendo
          data = file.readlines
          file.close
          data.each do |line|
            arreglo = line.split(', ')
            nombre = arreglo[0]
          end
#aprobados #metodo que calcula aprobados y tira mensaje con nombre y nota
       data.each do |line|
            arreglo = line.split(', ')
            nombre = arreglo[0]
          suma_notas = arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i
          numero_de_notas = (arreglo.length - 1).to_f 
          promedio = suma_notas / numero_de_notas
            if promedio.to_i >5
              puts "alumno #{nombre} aprobado con nota #{promedio}"
            end
        end
    end
    menu
    #no llames al menu en cada if, confunde!!!
##

    if opcion == 4
      #debio ser: if opcion.to_i == 4, ya que el opcion es un string(palabra) y no entiende la comparacion con un
      #entero (numero), por eso el programa no logra salir
        continuar = false
    end
end