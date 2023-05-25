cmake_minimum_required(VERSION 3.12)
project(pointless-fortran Fortran)
# TODO: add an ENABLE_COMPLEX option

# Set the source files for the library
set(SOURCES
    mymodule.f90
    dependencies.f90
    custom_type.f90
)

set(EXEC_SRC main.f90)

# Create the shared library
add_library(fortranlib SHARED ${SOURCES})

# Create an executable
add_executable(fortran_exec ${EXEC_SRC})

# Link the library to the executable
target_link_libraries(fortran_exec PRIVATE fortranlib)

# Set the output directory for the library
set_target_properties(fortranlib PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set_target_properties(fortran_exec PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
# set_target_properties(fortranlib PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/include)

# Install the library
install(TARGETS fortranlib DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/lib)
install(TARGETS fortran_exec DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/bin)

# Copy dependencies.mod after build
# not 100% convinced this is necessary, but it might become later
add_custom_command(TARGET fortranlib POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_CURRENT_BINARY_DIR}/dependencies.mod
        ${CMAKE_CURRENT_BINARY_DIR}/include/dependencies.mod
)
