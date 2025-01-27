# Guía de Instalación y Uso de los Scripts

Este repositorio contiene scripts diseñados para automatizar la instalación de `kubectl` y Kubernetes en sistemas Linux. A continuación, se explican los pasos necesarios para ejecutar estos scripts de forma segura y efectiva.

---

## **Requisitos Previos**

1. **Sistema Operativo:**
   - Linux (Ubuntu, Debian, o cualquier distribución compatible con apt).

2. **Permisos:**
   - Asegúrate de ejecutar los scripts con permisos de administrador (`sudo`).

3. **Conexión a Internet:**
   - Necesaria para descargar las herramientas y dependencias requeridas.

4. **Dependencias iniciales (si no las tienes instaladas, el script las gestiona):**
   - `curl`
   - `sha256sum`
   - `apt-transport-https`
   - `software-properties-common`

---

## **Pasos para Ejecutar los Scripts**

### 1. Clonar este Repositorio
Primero, clona el repositorio en tu máquina local:

```bash
git clone <URL-del-repositorio>
cd <nombre-del-repositorio>
```

---

### 2. Configurar los Scripts
Antes de ejecutar los scripts, asegúrate de que tengan permisos de ejecución. Esto se hace con el comando:

```bash
chmod +x kubectl_installer.sh kubernetes_installer.sh
```

---

### 3. Ejecutar el Script de Instalación de `kubectl`
Si solo necesitas instalar `kubectl` (herramienta cliente para Kubernetes), ejecuta el siguiente comando:

```bash
./kubectl_installer.sh
```

- **Qué hace este script:**
  - Verifica si las dependencias necesarias (`curl`, `sha256sum`) están instaladas.
  - Descarga y valida el binario de `kubectl`.
  - Instala el binario en el sistema.
  - Verifica que `kubectl` esté correctamente instalado.

---

### 4. Ejecutar el Script de Instalación de Kubernetes
Si deseas instalar Kubernetes completo (con `kubeadm`, `kubelet`, y configurar un clúster), ejecuta:

```bash
./kubernetes_installer.sh
```

- **Qué hace este script:**
  - Instala las herramientas necesarias (`kubelet`, `kubeadm`, `kubectl`).
  - Configura un clúster local usando `kubeadm`.
  - Instala la red de pods (Calico).
  - Verifica que Kubernetes esté configurado correctamente.

---

### 5. Verificar Instalaciones
#### Verificar `kubectl`:
Ejecuta el siguiente comando para verificar que `kubectl` está instalado y funcionando:

```bash
kubectl version --client
```

#### Verificar Kubernetes:
Para comprobar que Kubernetes está configurado correctamente y funcionando, utiliza:

```bash
kubectl cluster-info
```

---

## **Notas Adicionales**

1. **Errores Comunes:**
   - Si el script falla debido a permisos, asegúrate de ejecutarlo como administrador:
     ```bash
     sudo ./kubernetes_installer.sh
     ```

2. **Actualizar Kubernetes:**
   - Si necesitas actualizar las herramientas instaladas, puedes volver a ejecutar los scripts. Estos detectarán y actualizarán las versiones existentes.

3. **Eliminar Kubernetes:**
   - Si necesitas desinstalar Kubernetes, ejecuta:
     ```bash
     sudo kubeadm reset
     sudo apt-get remove --purge kubelet kubeadm kubectl
     sudo apt-get autoremove
     ```

---

## **Contribuciones**
Si tienes ideas para mejorar estos scripts o encuentras algún problema, por favor abre un issue o envía un pull request.

---

## **Licencia**
Este proyecto está licenciado bajo la [MIT License](LICENSE).
