# Instalador Automático de kubectl para Linux

Este repositorio contiene un script en Bash que permite instalar y configurar automáticamente `kubectl` en sistemas Linux. El script realiza las verificaciones necesarias, muestra información de manera vistosa, y guía al usuario paso a paso durante la instalación.

## Características del Script

1. **Verificación de dependencias:**
   - Comprueba que las herramientas necesarias (`curl`, `sha256sum`) estén instaladas.
   - Lista de manera clara las dependencias faltantes.

2. **Interfaz interactiva:**
   - Pregunta al usuario si desea continuar con la instalación.
   - Muestra mensajes y colores vistosos para facilitar la interacción.

3. **Instalación automatizada:**
   - Descarga la última versión de `kubectl` desde los repositorios oficiales de Kubernetes.
   - Verifica la integridad del archivo descargado utilizando sumas de verificación SHA-256.
   - Instala y configura `kubectl` en el sistema.

4. **Barra de progreso:**
   - Muestra un porcentaje visual durante las etapas críticas de la instalación.

5. **Verificación posterior:**
   - Comprueba que `kubectl` haya sido instalado correctamente y esté funcionando.

---

## Requisitos Previos

- Un sistema Linux con permisos de administrador (`sudo`).
- Conexión a Internet.
- Dependencias necesarias:
  - `curl`
  - `sha256sum`

Si alguna de estas herramientas no está instalada, el script lo indicará claramente y detendrá el proceso.

---

## Cómo Usar el Script

1. Clona este repositorio:
   ```bash
   git clone <URL-del-repositorio>
   cd <nombre-del-repositorio>
   ```

2. Haz que el script sea ejecutable:
   ```bash
   chmod +x install_kubectl.sh
   ```

3. Ejecuta el script:
   ```bash
   ./install_kubectl.sh
   ```

4. Sigue las instrucciones en pantalla. El script te guiará paso a paso durante todo el proceso.

---

## Funcionamiento del Script

### Paso 1: Verificar Dependencias
El script comprobará si `curl` y `sha256sum` están instalados. Si falta alguna herramienta, mostrará un mensaje y detendrá la instalación.

### Paso 2: Confirmar Instalación
Se preguntará al usuario si desea continuar. Si elige "no", la instalación se cancelará.

### Paso 3: Descargar e Instalar kubectl
El script:
- Descargará el binario de `kubectl`.
- Verificará su integridad comparando la suma SHA-256.
- Instalará el binario en `/usr/local/bin/`.

### Paso 4: Verificar la Instalación
El script ejecutará `kubectl version --client` para confirmar que `kubectl` está correctamente instalado.

---

## Ejemplo de Salida del Script

```bash
===============================
  INSTALADOR DE KUBECTL  
===============================

Paso 1: Verificar dependencias
Todas las dependencias están instaladas.

Paso 2: Confirmar instalación
¿Quieres continuar con la instalación de kubectl? (s/n): s

Paso 3: Instalar kubectl
[####################] 100%
kubectl se ha instalado correctamente.

Paso 4: Verificar instalación
kubectl está instalado y funcionando correctamente.
```

---

## Problemas Comunes

- **Fallo en la verificación SHA-256:**
  - Verifica que la descarga no haya sido interrumpida.
  - Asegúrate de tener una conexión estable a Internet.

- **Dependencias faltantes:**
  - Instala las dependencias necesarias antes de ejecutar el script:
    ```bash
    sudo apt-get install curl coreutils -y
    ```

---

## Contribuciones
¡Las contribuciones son bienvenidas! Si tienes ideas para mejorar este script o encuentras algún problema, por favor abre un issue o envía un pull request.

---

## Licencia
Este proyecto está licenciado bajo la [MIT License](LICENSE).
# kubernetsinstall
Instalation Kubernetes
