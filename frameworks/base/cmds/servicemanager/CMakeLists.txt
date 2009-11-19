add_executable(ServiceManager
    service_manager.c
    binder.c
    )

target_link_libraries(ServiceManager log)

