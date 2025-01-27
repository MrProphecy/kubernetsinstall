#!/bin/bash

# Colores para texto vistoso
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

# Mostrar encabezado vistoso
header() {
  echo -e "${BLUE}==============================="
  echo -e "  INSTALADOR DE KUBECTL  "
  echo -e "===============================${NC}"
}

# Verificar dependencias
check_dependencies() {
  echo -e "${YELLOW}Verificando dependencias...${NC}"
  local missing=()

  for cmd in curl sha256sum; do
    if ! command -v $cmd &>/dev/null; then
      missing+=("$cmd")
    fi
  done

  if [ ${#missing[@]} -ne 0 ]; then
    echo -e "${RED}Faltan dependencias: ${missing[*]}${NC}"
    return 1
  fi

  echo -e "${GREEN}Todas las dependencias están instaladas.${NC}"
  return 0
}

# Confirmar si el usuario desea continuar
confirm_installation() {
  read -p "¿Quieres continuar con la instalación de kubectl? (s/n): " choice
  case "$choice" in
    s|S ) echo -e "${GREEN}Continuando con la instalación...${NC}" ;;
    n|N ) echo -e "${RED}Instalación cancelada.${NC}"; exit 0 ;;
    * ) echo -e "${RED}Opción no válida. Por favor, ejecuta el script nuevamente.${NC}"; exit 1 ;;
  esac
}

# Descargar kubectl
install_kubectl() {
  echo -e "${YELLOW}Descargando kubectl...${NC}"
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

  echo -e "${YELLOW}Verificando integridad del archivo...${NC}"
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
  echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

  if [ $? -ne 0 ]; then
    echo -e "${RED}La verificación de integridad falló. Abortando.${NC}"
    exit 1
  fi

  echo -e "${YELLOW}Instalando kubectl...${NC}"
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/

  echo -e "${GREEN}kubectl se ha instalado correctamente.${NC}"
}

# Mostrar barra de progreso
progress_bar() {
  local duration=$1
  local increment=$((duration / 20))

  echo -ne "["
  for ((i = 0; i < 20; i++)); do
    sleep $increment
    echo -ne "#"
  done
  echo -e "] 100%"
}

# Verificar instalación
verify_installation() {
  echo -e "${YELLOW}Verificando instalación de kubectl...${NC}"
  if kubectl version --client &>/dev/null; then
    echo -e "${GREEN}kubectl está instalado y funcionando correctamente.${NC}"
  else
    echo -e "${RED}Algo salió mal. Por favor, verifica los pasos manualmente.${NC}"
  fi
}

# Ejecutar el script
main() {
  header

  echo -e "${YELLOW}Paso 1: Verificar dependencias${NC}"
  check_dependencies || exit 1

  echo -e "${YELLOW}Paso 2: Confirmar instalación${NC}"
  confirm_installation

  echo -e "${YELLOW}Paso 3: Instalar kubectl${NC}"
  progress_bar 5
  install_kubectl

  echo -e "${YELLOW}Paso 4: Verificar instalación${NC}"
  progress_bar 3
  verify_installation
}

main
