# Instalador Automático de Kubernetes para Linux

Este repositorio contiene un script en Bash que instala y configura automáticamente un clúster de Kubernetes en un sistema Linux. El script realiza comprobaciones de dependencias, guía al usuario paso a paso, y utiliza elementos visuales para facilitar la instalación.

## Características del Script

1. **Verificación de dependencias:**
   - Comprueba herramientas esenciales como `curl`, `kubeadm`, `kubelet` y las instala si faltan.

2. **Instalación automatizada:**
   - Configura los repositorios oficiales de Kubernetes.
   - Instala las herramientas necesarias (`kubelet`, `kubeadm`, `kubectl`).

3. **Inicialización del clúster:**
   - Configura un clúster local con `kubeadm`.
   - Instala una red de pods usando Calico.

4. **Interfaz interactiva:**
   - Muestra mensajes claros y vistosos con colores para una mejor experiencia de usuario.
   - Solicita confirmación antes de proceder con pasos críticos.

5. **Barra de progreso:**
   - Muestra un porcentaje visual durante las etapas importantes del proceso de instalación.

6. **Verificación final:**
   - Comprueba que Kubernetes esté correctamente instalado y funcionando.

---

## Requisitos Previos

- Un sistema Linux con permisos de administrador (`sudo`).
- Conexión a Internet.
- Dependencias necesarias (el script instalará las faltantes):
  - `curl`
  - `kubeadm`
  - `kubelet`
  - `kubectl`

---

## Cómo Usar el Script

1. Clona este repositorio:
   ```bash
   git clone <URL-del-repositorio>
   cd <nombre-del-repositorio>
   ```

2. Haz que el script sea ejecutable:
   ```bash
   chmod +x kubernetes_installer.sh
   ```

3. Ejecuta el script:
   ```bash
   ./kubernetes_installer.sh
   ```

4. Sigue las instrucciones en pantalla. El script te guiará paso a paso durante todo el proceso.

---

## Funcionamiento del Script

### Paso 1: Verificar Dependencias
El script comprobará si herramientas como `curl`, `kubeadm`, y `kubelet` están instaladas. Si faltan, las descargará e instalará automáticamente.

### Paso 2: Confirmar Instalación
Se preguntará al usuario si desea continuar con la instalación. Si se elige "no", el proceso se detendrá.

### Paso 3: Configurar el Clúster
El script inicializa un clúster local utilizando `kubeadm` y configura el acceso del usuario actual. También instala Calico como red de pods.

### Paso 4: Verificar Instalación
El script ejecutará comandos para asegurarse de que Kubernetes está correctamente configurado y funcionando.

---

## Ejemplo de Salida del Script

```bash
===============================
   INSTALADOR DE KUBERNETES    
===============================

Paso 1: Verificar dependencias
Dependencias instaladas correctamente.

Paso 2: Confirmar instalación
¿Quieres continuar con la instalación de Kubernetes? (s/n): s

Paso 3: Configurar el clúster de Kubernetes
[####################] 100%
Clúster inicializado correctamente.

Paso 4: Verificar instalación
Kubernetes está instalado y funcionando correctamente.
```

---

## Problemas Comunes

- **Errores al inicializar el clúster:**
  - Verifica que tu sistema tiene al menos 2 CPU, 2 GB de RAM y 2 GB de espacio en disco libre.

- **Problemas de red de pods:**
  - Asegúrate de que la red de pods (Calico) esté instalada correctamente. Puedes reinstalarla con:
    ```bash
    kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
    ```

---

## Contribuciones
¡Las contribuciones son bienvenidas! Si tienes ideas para mejorar este script o encuentras algún problema, por favor abre un issue o envía un pull request.

---

## Licencia
Este proyecto está licenciado bajo la [MIT License](LICENSE).
