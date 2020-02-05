# Proyecto2 : Salt-Stack

## Preparativos.


## Master: Instalar y Configurar.

Instalar el software del master.

```
zypper install salt-Master
```

![](img/01.png)

Modificar el fichero /etc/salt/master para configurar el master.

![](img/02.png)

Activar el servicio con el arranque del sistema.

![](img/03.png)

Iniciar el servicio.

![](img/04.png)

Consultar el estado de los minions de nuestro Master

![](img/05.png)

## Minion.

* Instalación y configuración.

Instalar el software del agente.

```
zypper install salt-minion
```

![](img/06.png)

Modificar el archivo /etc/salt/minion para definir cual va a ser el master.

![](img/08.png)

Activar el servicio del minion en el arranque y arrancar el servicio.

![](img/09.png)

![](img/10.png)

Comprobar si tenemos instalado un programa en el minion, por ejemplo apache2.

![](img/11.png)

Vemos que apache2 no esta instalado en el minion.

* Cortafuegos.

Añadir las reglas al cortafuegos para que no bloquee la conexión de salt.

![](img/07.png)


* Aceptación desde el Master.

Consulta de las peticiones en el master.

![](img/12.png)

Aceptar al minion y volver a comprobar.

![](img/13.png)

* Comprobar conectividad.

![](img/14.png)

## Salt States

* Preparar el directorio para los estados.

Crear los directorios base y devel en la ruta /srv/salt.

![](img/15.png)

Crear un archivo de configuración /etc/salt/master.d/roots.conf.

![](img/16.png)

Reiniciar el servicio en el master.

![](img/17.png)

* Crear nuevo estado.

Los ficheros de Salt se definen en ficheros SLS

Crear fichero /srv/salt/base/apache/init.sls:

![](img/18.png)

Entendamos las definiciones:

    Nuestro nuevo estado se llama apache porque el directorio donde están las definiciones se llama srv/salt/base/apache.

    La primera línea es un identificador (ID) del estado. Por ejemplo: install_apache o apache_service, es un texto que ponemos nosotros libremente, de forma que nos ayude a identificar lo que vamos a hacer.

    pkg.installed: Es una orden de salt que asegura que los paquetes estén instalado.

    service.running: Es una orden salt que asegura de que los servicios estén iniciado o parados.



* Asociar minions a estados.

Crear /srv/salt/base/top.sls, donde asociamos a todos los Minions con el estado que acabamos de definir.

![](img/19.png)

* Comprobar estados definidos.

En el master ejecutar

```
sudo salt '*' state.show_states
```

![](img/20.png)

* Aplicar el nuevo estados.

Consultar los estados en detalle en el master.

```
salt '*' state.show_lowstate
```

![](img/21.png)

```
salt '*' state.show_highstate
```

![](img/22.png)

Aplicar nuevo estado para todos los minions.

```
salt '*' state.apply apache
```

![](img/23.png)


## Crear estado "users".

Vamos a crear un estado llamado users que nos servirá para crear un grupo y usuarios en las máquinas Minions.

Crear directorio /srv/salt/base/users.

![](img/24.png)

Crear fichero /srv/salt/base/users/init.sls con las definiones para crear los siguiente:

Grupo mazingerz

Usuarios kojiXX, drinfiernoXX dentro de dicho grupo.

![](img/25.png)

Aplicar el estado.

![](img/26.png)

![](img/27.png)

Comprobación en el Minion.

![](img/28.png)

```
Podemos cambiar la configuracion del estado, aplicarla y salt detectará los cambios ejecutando solo estos.
Por ejemplo añadir la opción - password: 'encripted_password' para establecer la contraseña del usuario koji11.
```
## Crear estado 'directories'

Crear la carpeta /srv/salt/base/directories y el fichero /srv/salt/base/directories/init.sts.

![](img/29.png)

Aplicar el estado.

![](img/30.png)

Comprobación en el Minion.

![](img/31.png)

## Añadir un nuevo minion Windows.

Instalamos salt-minion en la máquina Windows.

![](img/32.png)

![](img/33.png)

Al terminar la instalación nos saldrá una opción para arrancar el servicio. Si no podemos abrir una consola como administrador y ejecutar sc start salt-minion.

![](img/34.png)

Comprobamos las peticiones en el master.

![](img/35.png)

Aceptamos la petición en el master y Comprobamos.

![](img/36.png)
