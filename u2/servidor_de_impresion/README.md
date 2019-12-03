# Servidor de Impresión GNU/Linux (CUPS).

## Jorge Chinea Polegre

## Rúbruica

* Comprobar que el servicio está en ejecución.

![service](img/1.png)

* Comprobar que se imprime de forma local.

Listado de impresoras en CUPS.

![impresoras](img/11.png)

Selección de la impresora para imprimir en local.

![local](img/8.png)

Registro en el directorio /var/spool/cups-pdf/nombre_de_usuario.

![registro](img/9.png)

* Comprobar que se imprime de forma remota.

Activar compartir impresora.

![compartir](img/10.png)

Comprobar que el puerto 631 con el service ipp esta abierto.

> la máquina smb-cli11g es la remota y la smb-server11 la máquina local.

![631](img/13.png)

Elegimos en Yast -> Impresoras la impresora remora.

![remota](img/14.png)

Registro de la impresión.

![reg_remoto](img/15.png)
