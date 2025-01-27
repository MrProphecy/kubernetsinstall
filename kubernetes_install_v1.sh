#!/bin/bash
# Install Kubernetes By Viking
# Colores para texto vistoso
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

# Mostrar encabezado vistoso
header() {
  echo -e "${BLUE}===============================${NC}"
  echo -e "   INSTALADOR DE KUBERNETES    "
  echo -e "===============================${NC}"
}

# Verificar dependencias
check_dependencies() {
  echo -e "${YELLOW}Verificando dependencias...${NC}"
  local missing=()

  for cmd in curl kubeadm kubelet; do
    if ! command -v $cmd &>/dev/null; then
      missing+=("$cmd")
    fi
  done

  if [ ${#missing[@]} -ne 0 ]; then
    echo -e "${RED}Faltan dependencias: ${missing[*]}. Procediendo a instalarlas.${NC}"
    return 1
  fi

  echo -e "${GREEN}Todas las dependencias están instaladas.${NC}"
  return 0
}

# Confirmar si el usuario desea continuar
confirm_installation() {
  read -p "¿Quieres continuar con la instalación de Kubernetes? (s/n): " choice
  case "$choice" in
    s|S ) echo -e "${GREEN}Continuando con la instalación...${NC}" ;;
    n|N ) echo -e "${RED}Instalación cancelada.${NC}"; exit 0 ;;
    * ) echo -e "${RED}Opción no válida. Por favor, ejecuta el script nuevamente.${NC}"; exit 1 ;;
  esac
}

# Instalar dependencias necesarias
install_dependencies() {
  echo -e "${YELLOW}Instalando dependencias necesarias...${NC}"

  sudo apt-get update && sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

  echo -e "${YELLOW}Agregando la clave pública de Kubernetes...${NC}"
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

  echo -e "${YELLOW}Agregando repositorio de Kubernetes...${NC}"
  cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
  deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

  sudo apt-get update
  sudo apt-get install -y kubelet kubeadm kubectl

  echo -e "${GREEN}Dependencias instaladas correctamente.${NC}"
}

# Configurar el clúster Kubernetes
setup_kubernetes_cluster() {
  echo -e "${YELLOW}Inicializando el clúster de Kubernetes...${NC}"
  sudo kubeadm init --pod-network-cidr=192.168.0.0/16

  echo -e "${YELLOW}Configurando el acceso para el usuario actual...${NC}"
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

  echo -e "${YELLOW}Instalando red de pods (Calico)...${NC}"
  kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

  echo -e "${GREEN}Clúster inicializado correctamente.${NC}"
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

# Verificar la instalación de Kubernetes
verify_installation() {
  echo -e "${YELLOW}Verificando instalación de Kubernetes...${NC}"

  if kubectl cluster-info &>/dev/null; then
    echo -e "${GREEN}Kubernetes está instalado y funcionando correctamente.${NC}"
  else
    echo -e "${RED}Hubo un problema al verificar Kubernetes. Revisa los logs para más detalles.${NC}"
  fi
}

# Ejecutar el script
main() {
  header

  echo -e "${YELLOW}Paso 1: Verificar dependencias${NC}"
  check_dependencies || install_dependencies

  echo -e "${YELLOW}Paso 2: Confirmar instalación${NC}"
  confirm_installation

  echo -e "${YELLOW}Paso 3: Configurar el clúster de Kubernetes${NC}"
  progress_bar 5
  setup_kubernetes_cluster

  echo -e "${YELLOW}Paso 4: Verificar instalación${NC}"
  progress_bar 3
  verify_installation
}

main
