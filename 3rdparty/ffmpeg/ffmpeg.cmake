# Binaries branch name: ffmpeg/master_20180220
# Binaries were created for OpenCV: 9819ebc0954c2df62943ebbd5936d325e5dc89e1
ocv_update(FFMPEG_BINARIES_COMMIT "0a0e88972a7ea97708378d0488a65f83e7cc5e69")
ocv_update(FFMPEG_FILE_HASH_BIN32 "b8120c07962d591e2e9071a1bf566fd0")
ocv_update(FFMPEG_FILE_HASH_BIN64 "dc9c50e7b05482acc25d6ce0ac61bf1d")
ocv_update(FFMPEG_FILE_HASH_CMAKE "3b90f67f4b429e77d3da36698cef700c")

function(download_win_ffmpeg script_var)
  set(${script_var} "" PARENT_SCOPE)

  set(ids BIN32 BIN64 CMAKE)
  set(name_BIN32 "opencv_ffmpeg.dll")
  set(name_BIN64 "opencv_ffmpeg_64.dll")
  set(name_CMAKE "ffmpeg_version.cmake")

  set(FFMPEG_DOWNLOAD_DIR "${OpenCV_BINARY_DIR}/3rdparty/ffmpeg")

  set(status TRUE)
  foreach(id ${ids})
    ocv_download(FILENAME ${name_${id}}
               HASH ${FFMPEG_FILE_HASH_${id}}
               URL
                 "$ENV{OPENCV_FFMPEG_URL}"
                 "${OPENCV_FFMPEG_URL}"
                 "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${FFMPEG_BINARIES_COMMIT}/ffmpeg/"
               DESTINATION_DIR ${FFMPEG_DOWNLOAD_DIR}
               ID FFMPEG
               RELATIVE_URL
               STATUS res)
    if(NOT res)
      set(status FALSE)
    endif()
  endforeach()
  if(status)
    set(${script_var} "${FFMPEG_DOWNLOAD_DIR}/ffmpeg_version.cmake" PARENT_SCOPE)
  endif()
endfunction()
