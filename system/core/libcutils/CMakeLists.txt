add_library(cutils
    abort_socket.c
    array.c
    hashmap.c
    atomic.c
    native_handle.c
    buffer.c
    socket_inaddr_any_server.c
    socket_local_client.c
    socket_local_server.c
    socket_loopback_client.c
    socket_loopback_server.c
    socket_network_client.c
    config_utils.c
    cpu_info.c
    load_file.c
    strdup16to8.c
    strdup8to16.c
    record_stream.c
    process_name.c
    properties.c
    threads.c
    mspace.c
    selector.c
    tztime.c
    tzstrftime.c
    adb_networking.c
    zygote.c
    ashmem-dev.c
    mq.c
    memory.c
    )

target_link_libraries(cutils log)

