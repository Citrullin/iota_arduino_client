
# shellcheck disable=SC2155
export TOOLCHAIN=xtensa-esp32-elf-

#export CFLAGS_PLATFORM="-mlongcalls -mtext-section-literals -fstrict-volatile-bitfields "
export ASFLAGS_PLATFORM=$CFLAGS_PLATFORM
export LDFLAGS_PLATFORM=$CFLAGS_PLATFORM
export _POSIX_READER_WRITER_LOCKS=true
###
#Generalprojectbuild
###
export CC=$TOOLCHAIN$(echo "gcc")
export CXX=$TOOLCHAIN$(echo "g++")
export LD=$TOOLCHAIN$(echo "ld")
export OC=$TOOLCHAIN$(echo "objcopy")
export OS=$TOOLCHAIN$(echo "size")

#Linkerscriptlocation.
#export LDSCRIPT="/home/citrullin/git/iota_arduino_client/ld/esp32.ld"
#SetC/LD/ASflags.
#-Werror
export CFLAGS+="-nostdlib -std=gnu11 "
export CFLAGS+="-Wno-old-style-declaration -Wno-long-long -Wno-implicit-function-declaration -Wno-unused-function -fno-strict-aliasing "
export CFLAGS+="-fdata-sections -ffunction-sections "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/vfs "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/esp32 "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/config "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/freertos "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/soc "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/driver "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/heap "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/newlib "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/lwip "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/esp_common "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/xtensa "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/arduino-esp32/tools/sdk/include/esp_rom "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/build/include "
export CFLAGS+="-I/home/citrullin/git/iota_arduino_client/build/include/keccak "
export CFLAGS+="-Os -g "
export CFLAGS+="-Dunix=true -DDEBUG=0 -D__GNU_VISIBLE=0 -D_XOPEN_SOURCE=0 -D__BSD_VISIBLE=0 -D__XSI_VISIBLE=0 "
export CFLAGS+="-D__STDC_VERSION__=199901L -D_GCC_LIMITS_H_=0 -DINT_MAX=2147483647 -DUINT_MAX=4294967295 -DCHAR_BIT=8 "
export CFLAGS+="-DINT_MIN=-2147483647 "
export LDFLAGS+="-Wl,-Map=$@.map -Wl,--cref -Wl,--gc-sections "
export LDFLAGS+=$LDFLAGS_PLATFORM
export LDFLAGS+="-lm -lc -lgcc"
#export ASFLAGS+="-c -O0 -Wall -fmessage-length=0"
export ASFLAGS+=$ASFLAGS_PLATFORM
#&& cmake ../esp-lwip
cd build && cmake -DCMAKE_INSTALL_PREFIX=$PWD -DCCLIENT_TEST=ON ../iota && make
