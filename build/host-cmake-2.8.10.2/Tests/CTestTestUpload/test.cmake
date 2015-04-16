cmake_minimum_required(VERSION 2.1)

# Settings:
set(CTEST_DASHBOARD_ROOT                "/home/aav/specter/buildroot-2013.08/output/build/host-cmake-2.8.10.2/Tests/CTestTest")
set(CTEST_SITE                          "aav-K52Je")
set(CTEST_BUILD_NAME                    "CTestTest-Linux-g++-Upload")

set(CTEST_SOURCE_DIRECTORY              "/home/aav/specter/buildroot-2013.08/output/build/host-cmake-2.8.10.2/Tests/CTestTestUpload")
set(CTEST_BINARY_DIRECTORY              "/home/aav/specter/buildroot-2013.08/output/build/host-cmake-2.8.10.2/Tests/CTestTestUpload")
set(CTEST_CMAKE_GENERATOR               "Unix Makefiles")
set(CTEST_BUILD_CONFIGURATION           "$ENV{CMAKE_CONFIG_TYPE}")

CTEST_START(Experimental)
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
CTEST_UPLOAD(FILES "${CTEST_SOURCE_DIRECTORY}/sleep.c" "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt")
CTEST_SUBMIT()
