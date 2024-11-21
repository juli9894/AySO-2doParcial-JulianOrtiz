# Punto C
# Creo una carpeta para docker en el home y me posiciono alli 
mkdir docker2parcial

# Creo carpeta home banking
mkdir appHomeBanking

# Creo dentro 2 archivos html
cat > index.html 
cat > contacto.html

# Vuelvo a la primer carpeta docker y creo el archivo dockerfile con el siguiente contenido
cat > dockerfile
FROM nginx
COPY appHomeBanking /usr/share/nginx/html

# Inicio e ingreso desde vm a docker e ingreso la contraseña
docker login -u juli9894
Ingresar contraseña 

# Construyo la imagen de docker
docker build -t juli9894/2parcial-ayso:v1.0 .

# Verificar imagen creada
docker image list

# Subir imagen a docker hub
docker push juli9894/2parcial-ayso:v1.0

# Revisar que se haya subido la imagen a docker hub:
Docker -> profile -> my profile -> repositories

# Una vez verificada la imagen la desplego desde vm
docker run -d -p 8080:80 juli9894/2parcial-ayso:v1.0

# Verificar que este corriendo
docker container ls

# Probar la aplicacion en el navegador
http://192.168.56.3:8080/index.html
http://192.168.56.3:8080/contacto.html


