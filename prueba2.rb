

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
            # En teoría deberia de recorrer el arreglo seleccionando los que son 0, 
            # pasando letras => 0 y los números los deja como números
            # y metiendolos en un arreglo...pero no entiendo porque no funciona :(
            numero_ausentes = (arreglo_ausentes.length)
            arreglo_nombre_ausente = [nombre, numero_ausentes]
            puts arreglo_nombre_ausente
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
##
    if opcion == 4
        continuar = false
    end
end