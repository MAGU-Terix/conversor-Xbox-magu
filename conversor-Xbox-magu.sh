#!/bin/bash

clear

TXT_LANG_1="1) Espanol (Spanish)"
TXT_LANG_2="2) English (Ingles)"

echo -e "\033[0;34m┌──────────────────────────────────────────────────────────────┐\033[0m"
printf "\033[0;34m│\033[0m   \033[0;32m%-58s\033[0m \033[0;34m│\033[0m\n" "$TXT_LANG_1"
printf "\033[0;34m│\033[0m   \033[0;32m%-58s\033[0m \033[0;34m│\033[0m\n" "$TXT_LANG_2"
echo -e "\033[0;34m└──────────────────────────────────────────────────────────────┘\033[0m"
echo -ne "\033[1;33m[>] Select Language / Selecciona Idioma [1-2]: \033[0m"
read -r IDIOMA

if [ "$IDIOMA" = "2" ]; then
    TXT_SUBTITLE="NATIVE VIDEO GAME MULTI-CONVERTER FOR GNU/LINUX"
    TXT_OPTIMIZED="Target: Pop!_OS / Ubuntu / Debian and derivatives"
    TXT_CHECK_RUST="[*] iso2god-rs binary not found. Compiling native environment..."
    TXT_DL_GITHUB="[*] Cloning source from GitHub..."
    TXT_COMP_RUST="[+] Building release binary with Cargo..."
    TXT_CHECK_XISO="[*] extract-xiso not found. Building secondary binary..."
    TXT_INST_XISO="[+] extract-xiso installed successfully."
    TXT_ERR_NO_ISO="[-] Error: No .iso files found in this directory."
    TXT_ERR_PLACE="[i] Run this script inside the folder with your ISO images."
    TXT_IMG_DETECTED="[+] Image detected:"
    TXT_MULTIPLE_ISO="[*] Multiple ISOs found in directory:"
    TXT_SELECT_JUEGO="[>] Select game index number: "

    TXT_OPT_GOD="1) Convert to GOD (Format for content/0000000000000000)"
    TXT_OPT_XEX="2) Convert to XEX (Folder format - Free files)"
    TXT_OPT_XBE="3) Convert to XBE (Classic Xbox - Emulator mode)"
    TXT_OPT_CANCEL="4) Cancel operation and Exit"

    TXT_SELECT_FORM="[>] Select your target format [1-4]: "
    TXT_INIT_JAULA="[*] Processing ISO via iso2god-rs backend..."
    TXT_LINUX_DET="[+] Linux environment detected: Using"
    TXT_HILOS_TEXT="out of"
    TXT_HILOS_MODE="logical threads (Multi-Thread enabled)"
    TXT_DUP_MATRIZ="[*] Copying ISO to build buffer..."
    TXT_EXEC_MOTOR="[+] Executing iso2god trim algorithm..."
    TXT_MOV_CONT="[*] Moving output container to destination path..."
    TXT_ERR_RUST="[-] Error: The engine finished but output structure is empty."
    TXT_EXT_XEX="[*] Extracting full directory tree to XEX format..."
    TXT_UNPACK_XBE="[*] Unpacking classic Xbox structure..."
    TXT_ERR_XBE="[-] Error: Extraction done but default.xbe was not found."
    TXT_ABORT_USER="[-] Operation aborted by user."
    TXT_ERR_MATRIZ="[-] Error: Invalid option selected."
    TXT_SUCCESS="[+] CONVERSION COMPLETED SUCCESSFULLY!"
    TXT_OUT_GEN="[i] Target format:"
    TXT_TIME_TOTAL="[i] Elapsed time:"
    TXT_SEC="seconds."
    TXT_LOCATION="[+] Output path:"
else
    TXT_SUBTITLE="MULTI-CONVERSOR DE VIDEOJUEGOS NATIVO PARA GNU/LINUX"
    TXT_OPTIMIZED="Entorno: Pop!_OS / Ubuntu / Debian y derivados"
    TXT_CHECK_RUST="[*] Binario iso2god-rs no detectado. Compilando entorno..."
    TXT_DL_GITHUB="[*] Clonando codigo fuente desde GitHub..."
    TXT_COMP_RUST="[+] Compilando ejecutable release con Cargo..."
    TXT_CHECK_XISO="[*] extract-xiso no detectado. Compilando binario alternativo..."
    TXT_INST_XISO="[+] extract-xiso instalado con exito."
    TXT_ERR_NO_ISO="[-] Error: No se encontraron archivos .iso en este directorio."
    TXT_ERR_PLACE="[i] Coloca este script en la misma carpeta donde tengas tus juegos."
    TXT_IMG_DETECTED="[+] Imagen detectada:"
    TXT_MULTIPLE_ISO="[*] Multiples ISOs encontradas en este directorio:"
    TXT_SELECT_JUEGO="[>] Selecciona el numero de juego a procesar: "

    TXT_OPT_GOD="1) Convertir a GOD (Formato content/0000000000000000)"
    TXT_OPT_XEX="2) Convertir a XEX (Formato carpeta - Archivos libres)"
    TXT_OPT_XBE="3) Convertir a XBE (Para Xbox Clasica - Modo emulador)"
    TXT_OPT_CANCEL="4) Cancelar operacion y Salir"

    TXT_SELECT_FORM="[>] Selecciona tu formato objetivo [1-4]: "
    TXT_INIT_JAULA="[*] Procesando ISO mediante modulo iso2god-rs..."
    TXT_LINUX_DET="[+] Entorno Linux: Usando"
    TXT_HILOS_TEXT="de"
    TXT_HILOS_MODE="hilos logicos activos (Multihilo habilitado)"
    TXT_DUP_MATRIZ="[*] Copiando ISO al directorio de trabajo..."
    TXT_EXEC_MOTOR="[+] Ejecutando algoritmo de trimeado iso2god..."
    TXT_MOV_CONT="[*] Moviendo contenedores finales a la ruta de destino..."
    TXT_ERR_RUST="[-] Error: El motor finalizo pero no se generaron bloques."
    TXT_EXT_XEX="[*] Extrayendo arbol de directorios a formato XEX..."
    TXT_UNPACK_XBE="[*] Extrayendo particion de Xbox Clasica..."
    TXT_ERR_XBE="[-] Error: Extraccion lista pero no se localizo default.xbe."
    TXT_ABORT_USER="[-] Operacion cancelada por el usuario."
    TXT_ERR_MATRIZ="[-] Error: Opcion no valida."
    TXT_SUCCESS="[+] ¡CONVERSION COMPLETADA CON EXITO!"
    TXT_OUT_GEN="[i] Formato de salida:"
    TXT_TIME_TOTAL="[i] Tiempo de ejecucion:"
    TXT_SEC="segundos."
    TXT_LOCATION="[+] Ubicacion:"
fi

clear

echo -e "\033[0;36m=====================================================================\033[0m"
echo -e "\033[0;32m __  __    _    ____ _   _     _____ _____ ____   ___  __  __  \033[0m"
echo -e "\033[0;32m|  \/  |  / \  / ___| | | |   |_   _| ____|  _ \ |___| \ \/ /  \033[0m"
echo -e "\033[0;32m| |\/| | / _ \| |  _| | | |     | | |  _| | |_) | | |   \  /   \033[0m"
echo -e "\033[0;32m| |  | |/ ___ \ |_| | |_| |     | | | |___|  _ <  | |   /  \   \033[0m"
echo -e "\033[0;32m|_|  |_/_/   \_\____|\___/      |_| |_____|_| \_\|___| /_/\_\  \033[0m"
echo -e "\033[0;36m=====================================================================\033[0m"
echo -e "        \033[0;34m${TXT_SUBTITLE}\033[0m"
echo -e "                 \033[1;33mVersión 1.2 - By MAGU TERIX (RGH Scene)\033[0m"
echo -e "  \033[0;32m${TXT_OPTIMIZED}\033[0m"
echo -e "\033[0;36m=====================================================================\033[0m\n"

BINARIO_LOCAL="$HOME/iso2god-rs/target/release/iso2god"

if [ ! -f "$BINARIO_LOCAL" ]; then
    echo -e "\033[1;33m${TXT_CHECK_RUST}\033[0m"
    sudo apt update && sudo apt install build-essential cmake git python3 curl cargo -y
    cd ~ && rm -rf iso2god-rs
    echo -e "\033[1;33m${TXT_DL_GITHUB}\033[0m"
    git clone https://github.com/iliazeus/iso2god-rs.git
    cd iso2god-rs
    echo -e "\033[0;32m${TXT_COMP_RUST}\033[0m"
    cargo build --release
fi

if ! command -v extract-xiso &> /dev/null; then
    echo -e "\033[1;33m${TXT_CHECK_XISO}\033[0m"
    cd ~ && rm -rf extract-xiso
    git clone --recursive https://github.com/XboxDev/extract-xiso.git &> /dev/null
    cd extract-xiso && mkdir build && cd build
    cmake .. &> /dev/null && make &> /dev/null
    sudo cp extract-xiso /usr/local/bin/ && sudo chmod +x /usr/local/bin/extract-xiso
    echo -e "\033[0;32m${TXT_INST_XISO}\033[0m"
fi

DIR_ACTUAL=$(pwd)

MAPFILE=()
while IFS= read -r -d $'\0' file; do
    MAPFILE+=("$file")
done < <(find "$DIR_ACTUAL" -maxdepth 1 -iname "*.iso" -print0 2>/dev/null)

CANTIDAD_ISOS=${#MAPFILE[@]}

if [ "$CANTIDAD_ISOS" -eq 0 ]; then
    echo -e "\033[0;31m${TXT_ERR_NO_ISO}\033[0m"
    echo -e "\033[1;33m${TXT_ERR_PLACE}\033[0m"
    exit 1
elif [ "$CANTIDAD_ISOS" -eq 1 ]; then
    ISO_PATH="${MAPFILE[0]}"
    echo -e "\033[0;32m${TXT_IMG_DETECTED}\033[0m $(basename "$ISO_PATH")"
else
    echo -e "\033[1;33m${TXT_MULTIPLE_ISO}\033[0m"
    for i in "${!MAPFILE[@]}"; do
        echo -e "    \033[0;36m$((i+1)))\033[0m $(basename "${MAPFILE[$i]}")"
    done
    echo -ne "\n\033[1;33m${TXT_SELECT_JUEGO}\033[0m"
    read -r SELECCION_ISO
    ISO_PATH="${MAPFILE[$((SELECCION_ISO-1))]}"
fi

ISO_NAME=$(basename "$ISO_PATH")
NOMBRE_JUEGO=$(basename "$ISO_PATH" .iso)

echo -e "\033[0;34m┌──────────────────────────────────────────────────────────────┐\033[0m"
printf "\033[0;34m│\033[0m   \033[0;36m%-58s\033[0m \033[0;34m│\033[0m\n" "$TXT_OPT_GOD"
printf "\033[0;34m│\033[0m   \033[0;36m%-58s\033[0m \033[0;34m│\033[0m\n" "$TXT_OPT_XEX"
printf "\033[0;34m│\033[0m   \033[0;36m%-58s\033[0m \033[0;34m│\033[0m\n" "$TXT_OPT_XBE"
printf "\033[0;34m│\033[0m   \033[0;31m%-58s\033[0m \033[0;34m│\033[0m\n" "$TXT_OPT_CANCEL"
echo -e "\033[0;34m└──────────────────────────────────────────────────────────────┘\033[0m"
echo -ne "\033[1;33m${TXT_SELECT_FORM}\033[0m"
read -r OPCION

START_TIME=$(date +%s)
NOMBRE_LIMPIO="${NOMBRE_JUEGO// /_}"

case "$OPCION" in
    1)
        FORMATO_ELEGIDO="GOD"
        JAULA_LOCAL="$DIR_ACTUAL/${NOMBRE_LIMPIO}_PROCESANDO_TEMP"
        OUT_GOD_DESTINO="$DIR_ACTUAL/${NOMBRE_LIMPIO}_GOD"

        HILOS_TOTALES=$(nproc)
        HILOS_ASIGNADOS=$((HILOS_TOTALES / 2))
        if [ "$HILOS_ASIGNADOS" -lt 1 ]; then
            HILOS_ASIGNADOS=1
        fi

        echo -e "\n\033[0;36m=====================================================================\033[0m"
        echo -e "\033[1;33m${TXT_INIT_JAULA}\033[0m"
        echo -e "\033[0;32m${TXT_LINUX_DET} \033[0;36m${HILOS_ASIGNADOS}\033[0;32m ${TXT_HILOS_TEXT} \033[0;36m${HILOS_TOTALES}\033[0;32m ${TXT_HILOS_MODE}\033[0m"
        echo -e "\033[0;36m=====================================================================\033[0m"

        mkdir -p "$JAULA_LOCAL/iso_src"
        mkdir -p "$JAULA_LOCAL/god_out"
        mkdir -p "$OUT_GOD_DESTINO"

        echo -e "\033[1;33m${TXT_DUP_MATRIZ}\033[0m"
        if [ ! -f "$JAULA_LOCAL/iso_src/$ISO_NAME" ]; then
            cp "$ISO_PATH" "$JAULA_LOCAL/iso_src/$ISO_NAME"
        fi

        echo -e "\033[0;32m${TXT_EXEC_MOTOR}\033[0m"
        $BINARIO_LOCAL "$JAULA_LOCAL/iso_src/$ISO_NAME" "$JAULA_LOCAL/god_out" --trim --num-threads "$HILOS_ASIGNADOS"

        if [ -n "$(ls -A "$JAULA_LOCAL/god_out" 2>/dev/null)" ]; then
            echo -e "\033[1;33m${TXT_MOV_CONT}\033[0m"
            cp -r "$JAULA_LOCAL/god_out"/* "$OUT_GOD_DESTINO/"
            OUTPUT_FINAL="$OUT_GOD_DESTINO"
            rm -rf "$JAULA_LOCAL"
            sync
            EXIT_STATUS=0
        else
            echo -e "\033[0;31m\n${TXT_ERR_RUST}\033[0m"
            exit 1
        fi
        ;;

    2)
        FORMATO_ELEGIDO="XEX"
        OUT_XEX="$DIR_ACTUAL/${NOMBRE_LIMPIO}_XEX"
        echo -e "\n\033[1;33m${TXT_EXT_XEX}\033[0m"

        rm -rf "$OUT_XEX" && mkdir -p "$OUT_XEX"

        extract-xiso -x "$ISO_PATH" &>/dev/null

        if [ -d "$DIR_ACTUAL/$NOMBRE_JUEGO" ]; then
            mv "$DIR_ACTUAL/$NOMBRE_JUEGO"/* "$OUT_XEX/" 2>/dev/null
            rm -rf "$DIR_ACTUAL/$NOMBRE_JUEGO"
        fi

        OUTPUT_FINAL="$OUT_XEX"
        sync
        EXIT_STATUS=0
        ;;

    3)
        FORMATO_ELEGIDO="XBE (Xbox Clásica)"
        OUT_XBE="$DIR_ACTUAL/${NOMBRE_LIMPIO}_Xbox1"
        echo -e "\n\033[1;33m${TXT_UNPACK_XBE}\033[0m"

        rm -rf "$OUT_XBE" && mkdir -p "$OUT_XBE"

        extract-xiso -x "$ISO_PATH" &>/dev/null

        if [ -d "$DIR_ACTUAL/$NOMBRE_JUEGO" ]; then
            mv "$DIR_ACTUAL/$NOMBRE_JUEGO"/* "$OUT_XBE/" 2>/dev/null
            rm -rf "$DIR_ACTUAL/$NOMBRE_JUEGO"
        fi

        if [ -f "$OUT_XBE/default.xbe" ] || [ -n "$(find "$OUT_XBE" -name "default.xbe" -print -quit)" ]; then
            OUTPUT_FINAL="$OUT_XBE"
            sync
            EXIT_STATUS=0
        else
            echo -e "\033[0;31m\n${TXT_ERR_XBE}\033[0m"
            exit 1
        fi
        ;;

    4)
        echo -e "\033[0;31m\n${TXT_ABORT_USER}\033[0m"
        exit 0
        ;;

    *)
        echo -e "\033[0;31m\n${TXT_ERR_MATRIZ}\033[0m"
        exit 1
        ;;
esac

if [ "$EXIT_STATUS" -eq 0 ]; then
    END_TIME=$(date +%s)
    ELAPSED=$((END_TIME - START_TIME))

    echo -e "\033[0;32m\n=====================================================================\033[0m"
    echo -e "\033[0;32m${TXT_SUCCESS}\033[0m"
    echo -e "\033[0;36m${TXT_OUT_GEN} \033[1;33m${FORMATO_ELEGIDO}\033[0m"
    echo -e "\033[0;36m${TXT_TIME_TOTAL} \033[1;33m${ELAPSED} ${TXT_SEC}\033[0m"
    echo -e "\033[0;32m${TXT_LOCATION} \033[0m${OUTPUT_FINAL}"
    echo -e "\033[0;32m=====================================================================\033[0m"
fi
