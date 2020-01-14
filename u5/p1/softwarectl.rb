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
  status = `whereis #{package[0]} |grep bin |wc -l`.chop
    if status == "0"
      puts "#{package[0]} -  No instalado"
    elsif status == "1"
      puts "#{package[0]} -  Instalado"
    end
end

def run(package)
  status = `whereis #{package[0]} |grep bin |wc -l`.chop
  if package[1] == "install"
    if status == "0"
      `apt-get install -y #{package[0]}`
      puts "#{package[0]} Correctamente instalado"
    elsif status == "1"
      puts "#{package[0]} Ya existe"
    end

  elsif package[1] == "remove"
    if status == "1"
      `apt-get --purge remove -y #{package[0]}`
      puts "#{package[0]} Correctamente desinstalado"
    elsif status == "0"
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
  lines = `cat #{filename}`.split("\n")
  lines.each do |p|
    package = p.split(":")
    show_status(package)
  end

elsif option == '--run'
  user = `id -u`.chop
  if user == "0"
    lines = `cat #{filename}`.split("\n")
    lines.each do |p|
      package = p.split(":")
      run(package)
    end

  else
    puts "Son necesarios permisos de administrador..."
    exit 1
  end

end
