import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor TaskManager {
    
    // Definición del tipo de datos para una tarea
    public type Task = {
        id: Nat;
        title: Text;
        description: Text;
        completed: Bool;
    };

    // Lista para almacenar las tareas
    var tasks: [Task] = [];
    var nextId: Nat = 1; // ID incremental para cada tarea

    // Función para añadir una nueva tarea
    public func addTask(title: Text, description: Text): async Task {
        let task = {
            id = nextId;
            title = title;
            description = description;
            completed = false;
        };
        tasks := Array.append(tasks, [task]);
        nextId += 1;
        return task;
    };

    // Función para obtener todas las tareas
    public func getTasks(): async [Task] {
        return tasks;
    };

    // Función para obtener una tarea específica por su ID
    public func getTaskById(taskId: Nat): async ?Task {
        return Array.find<Task>(tasks, func(task) { task.id == taskId });
    };

    // Función para marcar una tarea como completada
    public func completeTask(taskId: Nat): async ?Task {
        var foundTask : ?Task = null;
        tasks := Array.map<Task, Task>(tasks, func (task) {
            if (task.id == taskId) {
                let completedTask = { id = task.id; title = task.title; description = task.description; completed = true };
                foundTask := ?completedTask;
                completedTask
            } else {
                task
            }
        });
        return foundTask;
    };

    // Función para marcar una tarea como incompleta
    public func uncompleteTask(taskId: Nat): async ?Task {
        var foundTask : ?Task = null;
        tasks := Array.map<Task, Task>(tasks, func (task) {
            if (task.id == taskId and task.completed) {
                let uncompletedTask = { id = task.id; title = task.title; description = task.description; completed = false };
                foundTask := ?uncompletedTask;
                uncompletedTask
            } else {
                task
            }
        });
        return foundTask;
    };

    // Función para editar una tarea existente
    public func editTask(taskId: Nat, newTitle: Text, newDescription: Text): async ?Task {
        var foundTask : ?Task = null;
        tasks := Array.map<Task, Task>(tasks, func (task) {
            if (task.id == taskId) {
                let updatedTask = { id = task.id; title = newTitle; description = newDescription; completed = task.completed };
                foundTask := ?updatedTask;
                updatedTask
            } else {
                task
            }
        });
        return foundTask;
    };

    // Función para eliminar una tarea
    public func deleteTask(taskId: Nat): async Bool {
        let originalLength = tasks.size();
        tasks := Array.filter<Task>(tasks, func (task) {
            task.id != taskId
        });
        return tasks.size() < originalLength;
    };
};
