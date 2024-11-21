# Punto B

# Realizo dos copias de la carpeta con el vagrant
# Vm1
cambiar el nombre de la vm a vmAMN213
cambiar la IP a 192.168.56.8

# Vm2
cambiar el nombre de la vm a vmAnsDev213
cambiar la IP a 192.168.56.9

# Levantar las 2 VM
abro dos git y me posiciono en el directorio de cada una y ejecuto:
vagrant up
vagrant ssh

# Verificar ip en cada VM
ip address show

# Crear llave ssh en AMN
ssh-keygen

# Copio contenido de la llave publica de AMN
cat ~/.ssh/id_rsa.pub

# Pego el contenido de la llave de AMN en Ans
~/.ssh$ cat authorized_keys
vim authorized_keys

# Me concecto al host
ssh vagrant@192.168.56.9

# Reviso a que host estoy conectado
hostname

# Desde el AMN clono el repositorio
git clone https://github.com/upszot/UTN-FRA_SO_Ansible.git

# Me dirijo a UTN-FRA_SO_Ansible/ejemplo_02
# modifico inventory borrando todo y dejando solo la ip del host desarrollo
nano inventory

# Contenido del inventory
[desarrollo]
192.168.56.9

# modifico el playbook para que haga solo apd update e instale apache 
# elimino los ultimos modulos dejando como solo el que corre apt y el que instala apache
vim playbook.yml

# ejecuto Ansible en esta carpeta
ansible-playbook -i inventory playbook.yml

# comprobar instalacion de apache en desarrollo
sudo apt list --installed | grep apache
