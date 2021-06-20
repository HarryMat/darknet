# - Try to find Yolo
# Once done this will define
#  YOLO_FOUND - System has Yolo
#  YOLO_INCLUDE_DIRS - The Yolo include directories
#  YOLO_LIBRARIES - The libraries needed to use Yolo
#  YOLO_DEFINITIONS - Compiler switches required for using Yolo

find_package(PkgConfig)
pkg_check_modules(PC_YOLO QUIET yolo)
set(YOLO_DEFINITIONS ${PC_YOLO_CFLAGS_OTHER})

find_path(YOLO_INCLUDE_DIR NAMES darknet.h
          PATHS $ENV{HOME}/projects/darknet-yolov4/include
          ${PC_YOLO_INCLUDEDIR} ${PC_YOLO_INCLUDE_DIRS} )

find_library(YOLO_LIBRARY NAMES darknet
          PATHS $ENV{HOME}/projects/darknet-yolov4
          ${PC_YOLO_LIBDIR} ${PC_YOLO_LIBRARY_DIRS} )

set(YOLO_LIBRARIES ${YOLO_LIBRARY} )
set(YOLO_INCLUDE_DIRS ${YOLO_INCLUDE_DIR} )

message(STATUS "YOLO_LIBRARIES  : ${YOLO_LIBRARY}")
message(STATUS "YOLO_INCLUDE_DIR: ${YOLO_INCLUDE_DIR}")

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set YOLO_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(Yolo DEFAULT_MSG
          YOLO_LIBRARY YOLO_INCLUDE_DIR)

mark_as_advanced(YOLO_INCLUDE_DIR YOLO_LIBRARY )
