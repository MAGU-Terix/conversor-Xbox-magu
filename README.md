# 🎮 Conversor Xbox 360 - Edición Linux PRO

Desarrollado por MAGU-Terix 🐧🔥

# 🏷️ TERIX: TERminal Interactive eXecutable

[English Version](#english) | [Versión en Español](#español)

¡Convierte tus respaldos sin ventanas! 🚀

Un script automatizado de alto rendimiento para GNU/Linux diseñado para gestionar y convertir ISOs de Xbox 360 de forma nativa.

## 🛠️ Instalación y Usos

1. Clonación del Proyecto: Abre tu terminal favorita y lanza esta línea para descargar el repositorio y entrar en el:
	
	git clone https://github.com/MAGU-Terix/conversor-Xbox-magu.git && cd conversor-Xbox-magu

2. Verificación de Integridad (Recomendado):
Confirma que el script es auténtico y no una copia manipulada. Ejecuta esta línea dentro del directorio:
	
	echo "c03780e2ef6de6794dd708e9587f95c6176104b7dbc2cdbcf1e8058103c95652 conversor-Xbox-magu.sh" | sha256sum --check

3. Permisos de Ejecución: Una vez verificado, asigna los permisos necesarios para poder lanzarlo:
	
	chmod +x conversor-Xbox-magu.sh

4. Configuración Inicial (Dependencias):
La primera vez el script detectará si faltan herramientas de conversión. Te pedirá permisos de sudo únicamente para esta ocasión para instalar la paquetería necesaria.
Nota: Es normal que tras instalar todo el script finalice; esto significa que el entorno ya quedó preparado.

5. Ejecución y Formatos: Para convertir tus juegos, ve a la carpeta donde tengas tus ISOs y lanza el script llamándolo por su ruta:
	
	~/conversor-Xbox-magu/conversor-Xbox-magu.sh
	
Podrás elegir el Idioma y luego las siguientes opciones:

Opción 1: ISO a GOD (Games on Demand)

Opción 2: ISO a XEX (Archivos extraídos)

Opción 3: ISO a XBE (Xbox Original / Compatibilidad)

Opción 4: Salir

6. ¡Listo!
Con esto habrás logrado procesar tus juegos a máxima velocidad, aprovechando la potencia del kernel de Linux y, lo más importante... ¡sin ventanas!

## 📦 Verificación de Componentes

| Archivo | Tipo | SHA-256 Hash |
| :--- | :--- | :--- |
| `conversor-Xbox-magu.sh` | Bash Script | `c03780e2ef6de6794dd708e9587f95c6176104b7dbc2cdbcf1e8058103c95652` |
