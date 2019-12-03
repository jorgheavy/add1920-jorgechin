# Rúbrica Servidor 389-DS - OpenSUSE

## Unidad 4

## 2.3 Comprobar contenido DS LDAP

* ldapsearch -b "dc=ldap11,dc=curso1920" -x | grep dn , muestra el contenido de nuestra base de datos LDAP.

![](img/3.png)

* ldapsearch -H ldap://localhost -b "dc=ldap11,curso1920" -W -D "cn=Directory Manager" | grep dn ,  en este caso hacemos la consulta usando usuario/clave.

![](img/4.png)

## 3.3 Comprobar nuevo usuario

* ldapsearch -W -D "cn=Directory Manager" -b "dc=ldap11,dc=curso1920" "(uid= * )"

![](img/5.png)

![](img/6.png)

* Filtrado por los dn.

![](img/10.png)

## 4.3 Comprobar los usuarios creados

* Creación de usuarios.

![](img/8.png)

* Comprobación desde el cliente.

![](img/9.png)
