cmake_minimum_required(VERSION 2.8.9)

# Settings:
set(CTEST_DASHBOARD_ROOT                "/home/aav/specter/buildroot-2013.08/output/build/host-cmake-2.8.10.2/Tests/CTestTestMemcheck")
set(CTEST_SITE                          "aav-K52Je")
set(CTEST_BUILD_NAME                    "CTestTest-Linux-g++-MemcheckNotExist")

set(CTEST_SOURCE_DIRECTORY              "/home/aav/specter/buildroot-2013.08/output/build/host-cmake-2.8.10.2/Tests/CTestTestMemcheck/NotExist")
set(CTEST_BINARY_DIRECTORY              "/home/aav/specter/buildroot-2013.08/output/build/host-cmake-2.8.10.2/Tests/CTestTestMemcheck/NotExist")
set(CTEST_CVS_COMMAND                   "CVSCOMMAND-NOTFOUND")
set(CTEST_CMAKE_GENERATOR               "Unix Makefiles")
set(CTEST_BUILD_CONFIGURATION           "$ENV{CMAKE_CONFIG_TYPE}")
set(CTEST_COVERAGE_COMMAND              "/usr/bin/gcov")
set(CTEST_NOTES_FILES                   "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")
set(CTEST_MEMORYCHECK_COMMAND           "${CTEST_BINARY_DIRECTORY}/no-memcheck-exe")

CTEST_START(Experimental)
CTEST_MEMCHECK(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
