#!/bin/bash

# ==============================================================================
#  🛠️ MULTI-CONVERSOR ULTRA-NATIVO (ISO a GOD / XEX / XBE)
#  Desarrollado por: MAGU TERIX | Versión: 1.0 (Edición Coleccionista)
#  Optimizado para: GNU/Linux (Pop!_OS, Ubuntu, Debian y derivados)
# ==============================================================================

# Paleta de colores ANSI para entornos oscuros (Terminal Kitty)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin Color

clear

# Banner de bienvenida estético con la firma MAGU TERIX
echo -e "${CYAN}=====================================================================${NC}"
echo -e "${GREEN} __  __    _    ____ _   _ _____ _____ ____  _______  __  ${NC}"
echo -e "${GREEN}|  \/  |  / \  / ___| | | |_   _| ____|  _ \|_ _\ \ \/ /  ${NC}"
echo -e "${GREEN}| |\/| | / _ \| |  _| | | |  | | |  _| | |_) || |   \  /   ${NC}"
echo -e "${GREEN}| |  | |/ ___ \ |_| | |_| |  | | | |___|  _ < | |   /  \   ${NC}"
echo -e "${GREEN}|_|  |_/_/   \_\____|\___/   |_| |_____|_| \_\___| /_/\_\  ${NC}"
echo -e "${CYAN}=====================================================================${NC}"
echo -e "        ${BLUE}MULTI-CONVERSOR DE VIDEOJUEGOS NATIVO PARA GNU/LINUX${NC}"
echo -e "                 ${YELLOW}Versión 1.0 - By MAGU TERIX (RGH Scene)${NC}"
echo -e "  ${GREEN}Optimizado para: GNU/Linux (Pop!_OS, Ubuntu, Debian y derivados)${NC}"
echo -e "${CYAN}=====================================================================${NC}\n"

# 1. Validación de dependencias y compilación forzada en el HOME
BINARIO_LOCAL="$HOME/iso2god-rs/target/release/iso2god"

if [ ! -f "$BINARIO_LOCAL" ]; then
    echo -e "${YELLOW}[*] No se detectó compilación de iso2god-rs. Configurando entorno nativo...${NC}"
    sudo apt update && sudo apt install build-essential cmake git python3 curl cargo -y
    
    cd ~ && rm -rf iso2god-rs
    echo -e "${YELLOW}[*] Descargando código fuente directo de GitHub...${NC}"
    git clone https://github.com/iliazeus/iso2god-rs.git
    cd iso2god-rs
    echo -e "${GREEN}[+] Compilando con optimizaciones de bajo nivel en Rust...${NC}"
    cargo build --release
fi

if ! command -v extract-xiso &> /dev/null; then
    echo -e "${YELLOW}[*] No se detectó extract-xiso. Compilando binario secundario...${NC}"
    cd ~ && rm -rf extract-xiso
    git clone --recursive https://github.com/XboxDev/extract-xiso.git &> /dev/null
    cd extract-xiso && mkdir build && cd build
    cmake .. &> /dev/null && make &> /dev/null
    sudo cp extract-xiso /usr/local/bin/ && sudo chmod +x /usr/local/bin/extract-xiso
    echo -e "${GREEN}[+] extract-xiso instalado con éxito en el sistema.${NC}"
fi

DIR_ACTUAL=$(pwd)

# 2. Escaneo inteligente de imágenes ISO en el directorio
MAPFILE=()
while IFS= read -r -d $'\0' file; do
    MAPFILE+=("$file")
done < <(find "$DIR_ACTUAL" -maxdepth 1 -iname "*.iso" -print0 2>/dev/null)

CANTIDAD_ISOS=${#MAPFILE[@]}

if [ "$CANTIDAD_ISOS" -eq 0 ]; then
    echo -e "${RED}[-] Error Fatal: No hay archivos .iso en este directorio.${NC}"
    echo -e "${YELLOW}[i] Coloca este script en la misma carpeta donde tengas tus juegos.${NC}"
    exit 1
elif [ "$CANTIDAD_ISOS" -eq 1 ]; then
    ISO_PATH="${MAPFILE[0]}"
    echo -e "${GREEN}[+] Imagen detectada:${NC} $(basename "$ISO_PATH")"
else
    echo -e "${YELLOW}[*] Múltiples ISOs encontradas en este directorio:${NC}"
    for i in "${!MAPFILE[@]}"; do
        echo -e "   ${CYAN}$((i+1)))${NC} $(basename "${MAPFILE[$i]}")"
    done
    echo -ne "\n${YELLOW}[>] Selecciona el número del juego a procesar: ${NC}"
    read -r SELECCION_ISO
    ISO_PATH="${MAPFILE[$((SELECCION_ISO-1))]}"
fi

ISO_NAME=$(basename "$ISO_PATH")
NOMBRE_JUEGO=$(basename "$ISO_PATH" .iso)

# 3. Menú de inyección de formatos (Geometría corregida para Terminal)
echo -e "${BLUE}┌──────────────────────── OPTIONS MENU ────────────────────────┐${NC}"
echo -e "${BLUE}│${NC}  ${GREEN}1)${NC} Convertir a ${CYAN}GOD${NC} (Formato Para content/0000000000000000)  ${BLUE}│${NC}"
echo -e "${BLUE}│${NC}  ${GREEN}2)${NC} Convertir a ${CYAN}XEX${NC} (Formato carpeta - Archivos libres)      ${BLUE}│${NC}"
echo -e "${BLUE}│${NC}  ${GREEN}3)${NC} Convertir a ${CYAN}XBE${NC} (Para Xbox Clásica - Modo emulador)      ${BLUE}│${NC}"
echo -e "${BLUE}│${NC}  ${RED}4) Cancelar operación y Salir${NC}                               ${BLUE}│${NC}"
echo -e "${BLUE}└──────────────────────────────────────────────────────────────┘${NC}"
echo -ne "${YELLOW}[>] Selecciona tu formato objetivo [1-4]: ${NC}"
read -r OPCION

# ⏱️ CAPTURA DEL TIEMPO INICIAL DE PROCESAMIENTO
START_TIME=$(date +%s)

# Sanitización en memoria RAM: Transforma espacios en guiones bajos para el sistema de archivos
NOMBRE_LIMPIO="${NOMBRE_JUEGO// /_}"

case "$OPCION" in
    1)
        FORMATO_ELEGIDO="GOD"
        JAULA_LOCAL="$DIR_ACTUAL/${NOMBRE_LIMPIO}_PROCESANDO_TEMP"
        OUT_GOD_DESTINO="$DIR_ACTUAL/${NOMBRE_LIMPIO}_GOD"
        
        echo -e "\n${CYAN}=====================================================================${NC}"
        echo -e "${YELLOW}[*] INICIANDO ENTORNO AISLADO - PROCESAMIENTO RUST ULTRA-RÁPIDO${NC}"
        echo -e "${CYAN}=====================================================================${NC}"
        
        mkdir -p "$JAULA_LOCAL/iso_src"
        mkdir -p "$JAULA_LOCAL/god_out"
        mkdir -p "$OUT_GOD_DESTINO"
        
        echo -e "${YELLOW}[*] Duplicando matriz ISO al búfer local...${NC}"
        if [ ! -f "$JAULA_LOCAL/iso_src/$ISO_NAME" ]; then
            cp "$ISO_PATH" "$JAULA_LOCAL/iso_src/$ISO_NAME"
        fi
        
        echo -e "${GREEN}[+] Ejecutando motor nativo con algoritmo de Trimeado activo...${NC}"
        $BINARIO_LOCAL "$JAULA_LOCAL/iso_src/$ISO_NAME" "$JAULA_LOCAL/god_out" --trim
        
        if [ -n "$(ls -A "$JAULA_LOCAL/god_out" 2>/dev/null)" ]; then
            echo -e "${YELLOW}[*] Moviendo contenedores finales a la ruta de almacenamiento...${NC}"
            cp -r "$JAULA_LOCAL/god_out"/* "$OUT_GOD_DESTINO/"
            OUTPUT_FINAL="$OUT_GOD_DESTINO"
            rm -rf "$JAULA_LOCAL"
            sync # Forzar vaciado de buffers de disco
            EXIT_STATUS=0
        else
            echo -e "${RED}\n[-] Error Crítico: El motor Rust terminó pero no se generaron bloques.${NC}"
            exit 1
        fi
        ;;
        
    2)
        FORMATO_ELEGIDO="XEX"
        OUT_XEX="$DIR_ACTUAL/${NOMBRE_LIMPIO}_XEX"
        echo -e "\n${YELLOW}[*] Extrayendo árbol completo de directorios en formato XEX...${NC}"
        
        rm -rf "$OUT_XEX" && mkdir -p "$OUT_XEX"
        
        # Extracción directa nativa usando la sintaxis oficial de extract-xiso
        extract-xiso -x "$ISO_PATH" &>/dev/null
        
        # Mover los archivos extraídos a nuestra carpeta limpia estructurada
        if [ -d "$DIR_ACTUAL/$NOMBRE_JUEGO" ]; then
            mv "$DIR_ACTUAL/$NOMBRE_JUEGO"/* "$OUT_XEX/" 2>/dev/null
            rm -rf "$DIR_ACTUAL/$NOMBRE_JUEGO"
        fi
        
        OUTPUT_FINAL="$OUT_XEX"
        sync # Forzar vaciado de buffers de disco y liberar descriptores
        EXIT_STATUS=0
        ;;
        
    3)
        FORMATO_ELEGIDO="XBE (Xbox Clásica)"
        OUT_XBE="$DIR_ACTUAL/${NOMBRE_LIMPIO}_Xbox1"
        echo -e "\n${YELLOW}[*] Desempaquetando geometría de Xbox Clásica (Fase Retro)...${NC}"
        
        rm -rf "$OUT_XBE" && mkdir -p "$OUT_XBE"
        
        # Extracción directa nativa
        extract-xiso -x "$ISO_PATH" &>/dev/null
        
        if [ -d "$DIR_ACTUAL/$NOMBRE_JUEGO" ]; then
            mv "$DIR_ACTUAL/$NOMBRE_JUEGO"/* "$OUT_XBE/" 2>/dev/null
            rm -rf "$DIR_ACTUAL/$NOMBRE_JUEGO"
        fi
        
        # Validación del ejecutable maestro usando búsquedas relativas seguras
        if [ -f "$OUT_XBE/default.xbe" ] || [ -n "$(find "$OUT_XBE" -name "default.xbe" -print -quit)" ]; then
            OUTPUT_FINAL="$OUT_XBE"
            sync # Asegurar integridad de los bloques en el disco
            EXIT_STATUS=0
        else
            echo -e "${RED}\n[-] Alerta: La extracción terminó pero no se localizó el 'default.xbe'.${NC}"
            exit 1
        fi
        ;;
        
    4)
        echo -e "${RED}\n[-] Script cerrado. Operación abortada por el usuario.${NC}"
        exit 0
        ;;
        
    *)
        echo -e "${RED}\n[-] Error: Opción no contemplada en la matriz de la consola.${NC}"
        exit 1
        ;;
esac

# ⏱️ CÁLCULO Y REPORTE ESTÉTICO DEL TIEMPO FINAL DE EJECUCIÓN
if [ "$EXIT_STATUS" -eq 0 ]; then
    END_TIME=$(date +%s)
    ELAPSED=$((END_TIME - START_TIME))

    echo -e "${GREEN}\n=====================================================================${NC}"
    echo -e "${GREEN}[+] ¡PROCESO DE CONVERSIÓN COMPLETADO CON ÉXITO!${NC}"
    echo -e "${CYAN}[i] Formato de salida generado: ${YELLOW}${FORMATO_ELEGIDO}${NC}"
    echo -e "${CYAN}[i] Tiempo total de procesamiento: ${YELLOW}${ELAPSED} segundos.${NC}"
    echo -e "${GREEN}[+] Ubicación del juego listo: ${NC}${OUTPUT_FINAL}"
    echo -e "${GREEN}=====================================================================${NC}"
fi