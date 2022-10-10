using Workerd = import "/workerd/workerd.capnp";

const config :Workerd.Config = (
    services = [
        (name = "main", worker = .helloWorldWorker),
    ],

    sockets = [
        (name = "http", address = "*:8080", http = (), service = "main"),
    ],
);

const helloWorldWorker :Workerd.Worker = (
    modules = [
        (name = "hello-world", esModule = embed "hello-world.js"),
    ],

    compatibilityDate = "2022-09-16",
);
