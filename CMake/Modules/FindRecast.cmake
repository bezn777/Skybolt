# This module defines
#  RECAST_FOUND, if false, do not try to link to RECAST
#  RECAST_LIBRARIES, the libraries to link against
#  RECAST_INCLUDE_DIRS, where to find headers


FIND_PATH(RECAST_INCLUDE_DIR Recast.h
  PATHS
  $ENV{RECAST_HOME}/Recast/Include
)

FIND_PATH(DETOUR_INCLUDE_DIR DetourNavMesh.h
  PATHS
  $ENV{RECAST_HOME}/Detour/Include
)

FIND_PATH(DETOUR_UTIL_INCLUDE_DIR DebugDraw.h
  PATHS
  $ENV{RECAST_HOME}/DebugUtils/Include
)

FIND_LIBRARY(RECAST_LIBRARY
  NAMES Recast
  PATHS
  $ENV{RECAST_HOME}/Recast/Bin
)

FIND_LIBRARY(DETOUR_LIBRARY
  NAMES Detour
  PATHS
  $ENV{RECAST_HOME}/Detour/Bin
)

set(RECAST_INCLUDE_DIRS ${RECAST_INCLUDE_DIR}
	${DETOUR_INCLUDE_DIR}  ${DETOUR_UTIL_INCLUDE_DIR}
)

set(RECAST_LIBRARIES ${RECAST_LIBRARY} ${DETOUR_LIBRARY})

IF(RECAST_LIBRARIES AND RECAST_INCLUDE_DIRS)
  SET(RECAST_FOUND "YES")
ENDIF()