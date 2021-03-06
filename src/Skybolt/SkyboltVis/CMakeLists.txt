set(LIB_NAME SkyboltVis)

add_source_group_tree(. SOURCE_FILES)

include_directories("../")

find_package(Boost COMPONENTS log date_time filesystem regex system REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

find_package(OSG REQUIRED COMPONENTS osg osgDB osgGA osgText osgUtil osgViewer)
include_directories(${OSG_INCLUDE_DIR})

find_package(OpenThreads)

find_package(cxxtimer REQUIRED)
find_package(earcut REQUIRED)
find_package(httplib REQUIRED)
find_package(px_sched REQUIRED)

OPTION(USE_DELL_XPS_RTT_FIX "Use Dell XPS Render To Texture Fix")
if (USE_DELL_XPS_RTT_FIX)
	add_definitions(-USE_DELL_XPS_RTT_FIX)
endif()

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(LIBRARIES
	SkyboltCommon
	SkyboltSim
	MapAttributesConverter
	${Boost_LIBRARIES}
	${OSG_OSG_LIBRARY}
	${OSG_OSGDB_LIBRARY}
	${OSG_OSGGA_LIBRARY}
	${OSG_OSGTEXT_LIBRARY}
	${OSG_OSGUTIL_LIBRARY}
	${OSG_OSGVIEWER_LIBRARY}
	${OPENTHREADS_LIBRARIES}
	${muFFT_LIBRARIES}
	cxxtimer
	earcut
	httplib
	px_sched
)

add_library(${LIB_NAME} STATIC ${SOURCE_FILES} ${HEADER_FILES})

target_link_libraries(${LIB_NAME} ${LIBRARIES})

target_include_directories(${LIB_NAME} PUBLIC
	${Boost_INCLUDE_DIRS}
	${OIS_INCLUDE_DIR}
	${OSG_INCLUDE_DIR}
)

skybolt_install(${LIB_NAME})
skybolt_install(cxxtimer)
skybolt_install(earcut)
skybolt_install(httplib)
skybolt_install(px_sched)