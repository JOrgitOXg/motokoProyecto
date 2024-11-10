# TaskManager en Motoko

Este proyecto implementa un gestor de tareas simple en Motoko, utilizando una estructura básica que permite añadir, editar, completar, descompletar, eliminar y listar tareas. 

## Descripción del Proyecto

El TaskManager utiliza el lenguaje Motoko y la Internet Computer para gestionar tareas mediante operaciones asincrónicas. Cada tarea incluye un título, descripción, estado de completado y un ID único generado automáticamente. Los métodos expuestos permiten al usuario interactuar con la lista de tareas, gestionando cada tarea de forma individual.

## Estructura del Proyecto

La estructura principal del proyecto incluye:

- **Motoko Actor (TaskManager)**: Define el tipo `Task` y las funciones de manipulación de tareas.
- **Candid Interface**: Interfaz para el despliegue en Internet Computer.
- **Configuración de Canister**: Incluye el Internet Identity para la autenticación de usuarios y el `prueba_backend` donde reside la lógica del gestor de tareas.

### Funciones principales

- `addTask(title: Text, description: Text)`: Añade una nueva tarea con título y descripción.
- `getTasks()`: Retorna la lista de todas las tareas.
- `getTaskById(taskId: Nat)`: Obtiene una tarea específica por su ID.
- `completeTask(taskId: Nat)`: Marca una tarea como completada.
- `uncompleteTask(taskId: Nat)`: Marca una tarea como incompleta.
- `editTask(taskId: Nat, newTitle: Text, newDescription: Text)`: Edita el título y la descripción de una tarea.
- `deleteTask(taskId: Nat)`: Elimina una tarea específica.

## Configuración y Despliegue

Para ejecutar este proyecto, asegúrate de tener instalada la Internet Computer SDK (`dfx`). 

### Instalación de Dependencias

1. Clona este repositorio:
   ```bash
   git clone <URL-DE-ESTE-REPOSITORIO>
   cd <NOMBRE-DEL-REPOSITORIO>

2. Ejecución del Proyecto
  Para ejecutar el proyecto de forma local, sigue los pasos a continuación:

Inicia la Internet Computer en segundo plano:
  ```bash
dfx start --background
Despliega el proyecto completo:

  ```bash
dfx deploy
Despliega y configura Internet Identity: Este proyecto requiere autenticación mediante Internet Identity. Usa el siguiente comando para desplegar Internet Identity en tu entorno local:

  ```bash
dfx deploy internet_identity
Ejecuta Métodos del TaskManager: Puedes interactuar con el gestor de tareas llamando a sus métodos directamente desde la línea de comandos.