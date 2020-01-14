#!/usr/bin/env ruby

option = ARGV[0]
filename = ARGV[1]

def null
  puts '--help para consultar la ayuda'
end

def show_help
puts '
Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creacion.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:
        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove
        '
end

def get_version
  puts 'by Jorge Chinea Polegre el 12/01/2020'
end

def show_status(package)
  status = `whereis #{package[0]} |grep bin |wc -l`.to_i

    if status == 0
      puts "#{package[0]} No instalado"
    elsif status == 1
      puts "#{package[0]} Instalado"
    end
end

def run(package)
  status = `whereis #{package[0]} |grep bin |wc -l`.to_i
  action = "#{package[1]}".to_s

  if action == "install"
    if status == 0
      `apt-get install -y #{package[0]}`
      puts "#{package[0]} Correctamente"
    elsif status == 1
      puts "#{package[0]} Ya existe"
    end

  elsif action == "remove"
    if status == 1
      `apt-get --purge remove -y #{package[0]}`
      puts "#{package[0]} Correctamente desinstalado"
    elsif status == 0
      puts "#{package[0]} No se encuentra instalado"
    end
  end
end

if option.nil?
  null

elsif option == "--help"
  show_help

elsif option == "--version"
  get_version

elsif option == '--status'
  file = `cat #{filename}`
  f_lines = file.split("\n")
  f_lines.each do |a|
    package = a.split(":")
    check(package)
  end

elsif option == '--run'
  user = `id -u`.to_i

  if user == 0
    file = `cat #{filename}`
    f_lines = file.split("\n")
    f_lines.each do |a|
      package = a.split(":")
      install(package)
  end

  elsif user != 0
    puts "Se necesita ser usuario root para ejecutar el script"
    exit 1
  end

end
