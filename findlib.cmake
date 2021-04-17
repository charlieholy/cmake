
#set(CMAKE_INCLUDE_PATH "/var/fpwork/pechen/gnb/uplane/sdkuplane/prefix-root-list/asik-x86_64-ps_lfs-dynamic-linker-on-gcc9/usr/include")

#set(CMAKE_LIBRARY_PATH "/var/fpwork/pechen/gnb/uplane/sdkuplane/prefix-root-list/asik-x86_64-ps_lfs-dynamic-linker-on-gcc9/usr/lib")

find_library(JANSSON_LIBRARY
  NAMES jansson
  #HINTS /var/fpwork/pechen/gnb/uplane/sdkuplane/prefix-root-list/asik-x86_64-ps_lfs-dynamic-linker-on-gcc9/usr/
  #PATH_SUFFIXES lib
)

find_path(JANSSON_INCLUDE_DIR
  NAMES jansson.h
 # HINTS /var/fpwork/pechen/gnb/uplane/sdkuplane/prefix-root-list/asik-x86_64-ps_lfs-dynamic-linker-on-gcc9/usr
 # PATH_SUFFIXES include
)

message("jansson_lib: ${JANSSON_LIBRARY}")
message("jansson_inc: ${JANSSON_INCLUDE_DIR}")
