# Punto A
# Creo las particiones:
sudo fdisk /dev/sdc

# Particion Primaria 1(1GB)
n
p
# enter
# enter
+1G

# Particion Primaria 2(1GB)
n
p
# enter
# enter
+1G

# Particion Primaria 3(1GB)
n
p
# enter
# enter
+1G

# Particion extendida(3GB)
n
e
# enter
# enter

# Guardar
w

# Verificar particiones
lsblk

# Ver detalle de particiones
sudo fdisk -l /dev/sdc

# Crear particiones logicas dentro de la particion extendida
sudo fdisk /dev/sdc

# Particion 5 Logica (1.5GB)
n
# enter
+1.5G

# Particion 6 Logica (1.5GB)
n
# enter
+1.3G

# Guardar 
w



# Asignar primer particion como swap
sudo fdisk /dev/sdc
t
1
L
82
w

# Verificar la memoria libre ram
free -h

# Destinar particion 1 como swap
sudo mkswap /dev/sdc1

#Habilitar memoria swap
sudo swapon /dev/sdc1

# Verificar activo y encendido del swap
free -h
swapon -s


# Crear PV, VG, LV con LVM

# Cambiar sistema a LVM a particiones 2, 3, 4, 5, 6
sudo fdisk /dev/sdc

# Particion 2
t
2
L
8E

# Particion 3
t
3
L
8E

# Particion 5
t
5
L
8E

# Particion 6
t
6
L
8E

# Guardar
w

# Revisar las particiones
sudo fdisk -l /dev/sdc

# Crear volumen fisico (PV) en cada particion
sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6

# ver PV (volumenes fisicos)
sudo pvs

# Crear Grupo de volumenes(VG)
sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6

# ver VG y PV
sudo vgs
sudo pvs

# Crear volumenes logicos desde vgDevelopers
sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
sudo lvcreate -L 1G vgDevelopers -n lvTesters
sudo lvcreate -L .9g vgDevelopers -n lvDevops

# Crear 1 volumen logico desde vg vgAdmin
sudo lvcreate -L 1.9G vgAdmin -n lvAdmin

# Revisar lv
sudo lvs
sudo pvs

# Ver informacion de los lv y su ruta
sudo fdisk -l
# Ruta /dev/mapper/vgDevelopers-lvDevelopers

# Formatear lvs
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin

# Verificar fs y datos lv
sudo lsblk -f

# Montar los LV
sudo mkdir /mnt/lvDevelopers
sudo mkdir /mnt/lvTesters
sudo mkdir /mnt/lvDevops
sudo mkdir /mnt/lvAdmin

sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers/
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters/
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops/
sudo mount /dev/mapper/vgAdmin-lvAdmin /mnt/lvAdmin

# Verificar montaje
df -h
lsblk -f



