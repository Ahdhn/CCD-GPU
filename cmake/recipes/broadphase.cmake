if(TARGET STQ::CUDA)
    return()
endif()

message(STATUS "Third-party: creating target 'STQ::CUDA'")

option(STQ_WITH_CPU "Enable CPU Implementation" OFF)
option(STQ_WITH_CUDA "Enable CUDA Implementation" ON)

if(EXISTS "${CCDGPU_BROADPHASE_PATH}")
    message(STATUS "Using Broadphase found at: ${CCDGPU_BROADPHASE_PATH}")
    add_subdirectory("${CCDGPU_BROADPHASE_PATH}" "${PROJECT_BINARY_DIR}/broadphase")
else()
    message(WARNING "${CCDGPU_BROADPHASE_PATH} does not exist, fetching Broadphase")
    include(FetchContent)
    FetchContent_Declare(
        broadphase
        GIT_REPOSITORY https://github.com/Ahdhn/broadphase-gpu.git
        GIT_TAG 6d230e851b50239305496b8f97d528b15b556de7
        GIT_SHALLOW FALSE
    )
    FetchContent_MakeAvailable(broadphase)
endif()
