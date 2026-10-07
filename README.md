# Tarea1.1.2 VAGRANT

## PARTE A 

1. **Vagrant y el Vagrantfile.** Explica brevemente qué problema resuelve Vagrant y distingue el anfitrión, el proveedor de virtualización, la box y la máquina virtual. Averigua en qué lenguaje está escrito el `Vagrantfile`. Analiza el archivo inicial y, al terminar la práctica, comenta cada línea activa del archivo final: qué configura, por qué la añadiste y cómo compruebas que ha surtido efecto. (Sin terminar, terminar al finalizar la práctica)


Vagrant soluciona problemas de compatibilidad de software con algunos sistemas operativos.

Anfitrión: Es el ordenador real, dónde instalamos vagrant y virtualbox.
Proveedor de virtualización: Es el programa que crea y gestiona las máquinas virtuales.
Box: La imágen base del sistema operativo que Vagrant usa para crear la VM
Máquina virtual:El sistema operativo que se ejecuta dentro del proveedor, creado a partir de la box.

El lenguaje de programación de Vagrantfile es Ruby 

Archivo inicial: En lo primero que puedo observar es que está escrito en el lenguaje Ruby. Otra cosa que resalta es que hay muchas líneas de código pero todas, excepto 3 están comentadas

2.  **Aprovisionamiento**. Investiga qué es un provisioner, dónde se ejecuta el script, cuándo lo lanza Vagrant y qué diferencia hay entre `inline:` y `path:`. Explica qué ocurre si modificas el script después del primer `vagrant up` y cómo lo ejecutarías de nuevo. 


El provisioner se refiere al proceso de configurar la infraestructura de TI, incluyendo hardware, redes, máquinas virtuales y otros recursos, y hacer que los recursos estén disponibles para los sistemas y los usuarios.
El script se puede ejecutar desde powershell, puppet, ansible y chef.

Por defecto, sólo se ejecuta durante la primera ejecución de $vagrant up. Si detenemos el sistema con $vagrant halt o $vagrant suspend, la próxima ejecución de $vagrant up omitirá la etapa de aprovisionamiento. Aunque podemos modificar ese comportamiento con las opciones –provision y –no-provision.
La diferencia entre inline y path es que, inline es un código escrito directamente dentro del Vagrantfile y path es un código guardado en un archivo externo que Vagran tiene que encontrar y ejecutar con su ruta.

Si modifico el script después del primer vagrant up, Vagrant no lo ejecutará automáticamente, hay que ejecutarlo de nuevo con vagrant provision o vagrant up - -provision para aplicar cambios.

3.  **Interfaces y redes**. Investiga qué conexión de red configura Vagrant por defecto y para qué la utiliza. Averigua cómo se añade en el Vagrantfile una segunda interfaz con dirección IP fija. Compara NAT, red interna, red privada host-only y red pública: explica con quién puede comunicarse la máquina en cada caso y qué función cumple el reenvío de puertos. Presta especial atención a la diferencia entre la red interna de VirtualBox y la red privada host-only de VMware. Investiga cómo se configura la segunda interfaz en el proveedor que utilices. ¿Añadirla elimina la NAT predeterminada? ¿El reenvío de puertos crea una interfaz nueva? En la parte C configurarás una máquina con dos interfaces: NAT y red de laboratorio. Examina después sus direcciones y rutas de red, relaciona lo observado con el Vagrantfile e incluye un esquema de la arquitectura en tu README.md. Como solo hay una máquina, no se pide demostrar comunicación con otra VM.


Vagrant asume que por defecto hay una red NAT y la utiliza para tener siempre una forma de comunicarse con la máquina de invitados.

Se pueden definir varias redes con la llamada “config.vm.network” y para añadir una segunda interfaz con dirección ip fija se usa la opción private network, indicando la IP que queremos.

El reenvío de puertos funciona redirigiendo solicitudes solicitudes de comunicación de una dirección IP y puertos externos a una dirección IP y puertos internos en una red privada, como red doméstica

| Tipo de red | Con quien se comunica la VM |
| --- | --- |
| NAT | Con internet |
| RED INTERNA | Con otras VM que estén en la misma red |
| RED PRIVADA | Con el host y con otras VM en la misma red privada |
| HOST-ONLY | Con el host y con otras VM host-only |
| RED PÚBLICA | Con cualquier equipo de la red física |

La red interna de virtualbox permite a las máquinas virtuales comunicarse entre sí sin acceso a internet, proporcionando un entorno aislado y seguro. Por otro lado, la red privada de host-only crea una red privada entre el host y la máquina virtual permitiendo que el host tenga una comunicación bidireccional directa con la VM, aunque sin acceso a internet.

Añadir una segunda interfaz no elimina la interfaz NAT, porque vagrant siempre crea la interfaz NAT por defecto.

El reenvío de puertos no crea una interfaz nueva porque solo redirige el tráfico.

4. Órdenes y carpeta compartida. En una tabla breve, indica cuándo usarías `up`, `status`, `ssh`, `reload`, `provision`, `halt` y `destroy`; marca cuáles llegaste a ejecutar. Averigua qué es `/vagrant` y comprueba qué archivos aparecen allí. 


| NOMBRE | CUANDO SE USA | EJECUCIÓN |
| --- | --- | --- |
| Up | Cuando creamos la máquina virtual y la arrancamos | Si |
|Status | Para ver el estado de la máquina | Si |
| ssh | Para cuando queremos entrar en la máquina por consola | Si |
| Reload | Para iniciar la máquina | No |
| Provision | Para ejecutar de nuevo los scripts de aprovisionamiento | Si |
| halt | Para apagar la máquina virtual | Si |
|Destroy | Para borrar la máquina por completo | No |

/Vagrant es la carpeta compartida que Vagrant monta dentro de la máquina virtual.


## ¿Qué es Vagrant y porque resulta útil?
Vagrant es una herramienta de código abierto para la creación y gestión de entornos virtualizados de desarrollo. Permite definir, configurar y provisionar máquinas virtuales de manera sencilla y automatizada, utilizando un archivo de configuración llamado *vagrant file*.
Es útil usarlo porque puedes definir tu entorno de desarrollo una sola vez y compartirlo con tu equipo, cada proyecto puede tener su propia máquina virtual sin afectar tu sistema principal, soporta diferentes proveedores de virtualización como VirtualBox, VMware..., garantiza que todos los miembros del equipo usen el mismo entorno, sin problemas de configuración y puedes instalar dependencias automáticamente usando shell, scripts....

