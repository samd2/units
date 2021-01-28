# Use, modification, and distribution are
# subject to the Boost Software License, Version 1.0. (See accompanying
# file LICENSE.txt)
#
# Copyright Rene Rivera 2020.

# For Drone CI we use the Starlark scripting language to reduce duplication.
# As the yaml syntax for Drone CI is rather limited.
#
#
globalenv={'B2_VARIANT': 'variant=release,debug'}
linuxglobalimage="cppalliance/droneubuntu1404:1"
windowsglobalimage="cppalliance/dronevs2019"

def main(ctx):
  return [
  linux_cxx("TOOLSET=gcc CXXSTD=c++03 Job 0", "g++", packages="binutils-gold gdb libc6-dbg gcc-6", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': 'c++03', 'DRONE_JOB_UUID': 'b6589fc6ab'}, globalenv=globalenv),
  linux_cxx("TOOLSET=clang CXXSTD=c++03 Job 1", "clang++", packages="binutils-gold gdb libc6-dbg gcc-6", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'clang', 'CXXSTD': 'c++03', 'DRONE_JOB_UUID': '356a192b79'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc COMPILER=g++-7 CXXSTD=c++17 Job 2", "g++-7", packages="g++-7 gcc-6", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'COMPILER': 'g++-7', 'CXXSTD': 'c++17', 'DRONE_JOB_UUID': 'da4b9237ba'}, globalenv=globalenv),
  linux_cxx("TOOLSET=clang COMPILER=clang++-5.0 CXXSTD=c++ Job 3", "clang++-5.0", packages="clang-5.0 g++-7 gcc-6", llvm_os="trusty", llvm_ver="5.0", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-5.0', 'CXXSTD': 'c++17', 'DRONE_JOB_UUID': '77de68daec'}, globalenv=globalenv),
  osx_cxx("TOOLSET=clang CXXSTD=c++03 Job 4", "clang++", packages="", buildtype="boost", buildscript="drone", environment={'TOOLSET': 'clang', 'CXXSTD': 'c++03', 'DRONE_JOB_UUID': '1b64538924'}, globalenv=globalenv),
  osx_cxx("TOOLSET=clang CXXSTD=c++03 Job 5", "clang++", packages="", buildtype="boost", buildscript="drone", xcode_version="9.1", environment={'TOOLSET': 'clang', 'CXXSTD': 'c++03', 'DRONE_JOB_UUID': 'ac3478d69a'}, globalenv=globalenv),
  linux_cxx("COMMENT=Coverity Scan Job 6", "g++", packages="binutils-gold gdb libc6-dbg gcc-6", buildtype="812bc2fc53-d6c8a1dccb", buildscript="drone", image=linuxglobalimage, environment={'COMMENT': 'Coverity Scan', 'DRONE_JOB_UUID': 'c1dfd96eea'}, globalenv=globalenv),
  linux_cxx("COMMENT=UBSAN B2_VARIANT=variant=debug TOOL Job 7", "clang++-5.0", packages="clang-5.0 g++-7 gcc-6", llvm_os="trusty", llvm_ver="5.0", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'COMMENT': 'UBSAN', 'B2_VARIANT': 'variant=debug', 'TOOLSET': 'clang', 'COMPILER': 'clang++-5.0', 'CXXSTD': 'c++03', 'B2_CXXFLAGS': 'cxxflags=-fno-omit-frame-pointer cxxflags=-fsanitize=undefined cxxflags=-fsanitize=integer', 'B2_LINKFLAGS': 'linkflags=-fsanitize=undefined', 'DRONE_JOB_UUID': '902ba3cda1'}, globalenv=globalenv),
    ]

# from https://github.com/boostorg/boost-ci
load("@boost_ci//ci/drone/:functions.star", "linux_cxx","windows_cxx","osx_cxx","freebsd_cxx")
