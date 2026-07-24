@echo on

set CMAKE_POLICY_VERSION_MINIMUM=4.0

cmake -S iceoryx_meta -B build ^
  %CMAKE_ARGS% ^
  -G Ninja ^
  -DBUILD_SHARED_LIBS=ON ^
  -DBUILD_TEST=OFF
if errorlevel 1 exit 1

cmake --build build --config Release --parallel %CPU_COUNT%
if errorlevel 1 exit 1

cmake --install build --config Release
if errorlevel 1 exit 1
