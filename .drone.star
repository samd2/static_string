# Use, modification, and distribution are
# subject to the Boost Software License, Version 1.0. (See accompanying
# file LICENSE.txt)
#
# Copyright Rene Rivera 2020.

# Configuration for https://cloud.drone.io/.

# For Drone CI we use the Starlark scripting language to reduce duplication.
# As the yaml syntax for Drone CI is rather limited.

def main(ctx):
  return [
  linux_cxx("COMMENT=codecov.io B2_CXXSTD=11 B2_TOOLSET=gc Job 0", "g++-8", packages="g++-8", buildtype="b5847f804b-0e6b68a530", environment={'COMMENT': 'codecov.io', 'B2_CXXSTD': '11', 'B2_TOOLSET': 'gcc-8', 'B2_DEFINES': 'define=BOOST_NO_STRESS_TEST=1', 'DRONE_JOB_UUID': 'b6589fc6ab'}),
  linux_cxx("COMMENT=asan B2_VARIANT=variant=debug B2_TOOL Job 1", "g++-8", packages="g++-8", buildtype="boost", environment={'COMMENT': 'asan', 'B2_VARIANT': 'variant=debug', 'B2_TOOLSET': 'gcc-8', 'B2_CXXSTD': '11,14', 'B2_CXXFLAGS': 'address-sanitizer=norecover', 'B2_DEFINES': 'define=BOOST_NO_STRESS_TEST=1', 'DRONE_EXTRA_PRIVILEGED': 'True', 'DRONE_JOB_UUID': '356a192b79'}, privileged=True),
  linux_cxx("COMMENT=tsan B2_VARIANT=variant=debug B2_TOOL Job 2", "g++-8", packages="g++-8", buildtype="boost", environment={'COMMENT': 'tsan', 'B2_VARIANT': 'variant=debug', 'B2_TOOLSET': 'gcc-8', 'B2_CXXSTD': '11,14', 'B2_CXXFLAGS': 'thread-sanitizer=norecover', 'B2_DEFINES': 'define=BOOST_NO_STRESS_TEST=1', 'DRONE_JOB_UUID': 'da4b9237ba'}),
  linux_cxx("COMMENT=ubsan B2_VARIANT=variant=debug B2_TOO Job 3", "g++-8", packages="g++-8", buildtype="boost", environment={'COMMENT': 'ubsan', 'B2_VARIANT': 'variant=debug', 'B2_TOOLSET': 'gcc-8', 'B2_CXXSTD': '11,14', 'B2_CXXFLAGS': 'undefined-sanitizer=norecover', 'B2_DEFINES': 'define=BOOST_NO_STRESS_TEST=1', 'B2_LINKFLAGS': 'linkflags=-fuse-ld=gold', 'UBSAN_OPTIONS': 'print_stacktrace=1', 'DRONE_JOB_UUID': '77de68daec'}),
  linux_cxx("COMMENT=valgrind B2_TOOLSET=clang-6.0 B2_CXXS Job 4", "clang++-6.0", packages="clang-6.0 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="6.0", buildtype="b5847f804b-db180b7bd2", environment={'COMMENT': 'valgrind', 'B2_TOOLSET': 'clang-6.0', 'B2_CXXSTD': '11,14', 'B2_DEFINES': 'define=BOOST_NO_STRESS_TEST=1', 'B2_VARIANT': 'variant=debug', 'B2_TESTFLAGS': 'testing.launcher=valgrind', 'VALGRIND_OPTS': '--error-exitcode=1', 'DRONE_JOB_UUID': '1b64538924'}),
  linux_cxx("B2_TOOLSET=gcc-4.8 B2_CXXSTD=11 Job 5", "g++-4.8", packages="g++-4.8", buildtype="boost", image="cppalliance/droneubuntu1404:1", environment={'B2_TOOLSET': 'gcc-4.8', 'B2_CXXSTD': '11', 'DRONE_JOB_UUID': 'ac3478d69a'}),
  linux_cxx("B2_TOOLSET=gcc-4.9 B2_CXXSTD=11 Job 6", "g++-4.9", packages="g++-4.9", buildtype="boost", image="cppalliance/droneubuntu1404:1", environment={'B2_TOOLSET': 'gcc-4.9', 'B2_CXXSTD': '11', 'DRONE_JOB_UUID': 'c1dfd96eea'}),
  linux_cxx("B2_TOOLSET=gcc-5 B2_CXXSTD=11,14 Job 7", "g++-5", packages="g++-5", buildtype="boost", environment={'B2_TOOLSET': 'gcc-5', 'B2_CXXSTD': '11,14', 'DRONE_JOB_UUID': '902ba3cda1'}),
  linux_cxx("B2_TOOLSET=gcc-6 B2_CXXSTD=11,14 Job 8", "g++-6", packages="g++-6", buildtype="boost", environment={'B2_TOOLSET': 'gcc-6', 'B2_CXXSTD': '11,14', 'DRONE_JOB_UUID': 'fe5dbbcea5'}),
  linux_cxx("B2_TOOLSET=gcc-7 B2_CXXSTD=14,17 Job 9", "g++-7", packages="g++-7", buildtype="boost", environment={'B2_TOOLSET': 'gcc-7', 'B2_CXXSTD': '14,17', 'DRONE_JOB_UUID': '0ade7c2cf9'}),
  linux_cxx("B2_TOOLSET=gcc-8 B2_CXXSTD=17 Job 10", "g++-8", packages="g++-8", buildtype="boost", environment={'B2_TOOLSET': 'gcc-8', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': 'b1d5781111'}),
  linux_cxx("B2_TOOLSET=gcc-9 B2_CXXSTD=17 Job 11", "g++-9", packages="g++-9", buildtype="boost", environment={'B2_TOOLSET': 'gcc-9', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': '17ba079149'}),
  linux_cxx("B2_TOOLSET=clang-3.8 B2_CXXSTD=11 Job 12", "clang++-3.8", packages="clang-3.8 libstdc++-6-dev", llvm_os="xenial", llvm_ver="3.8", buildtype="boost", image="cppalliance/droneubuntu1404:1", environment={'B2_TOOLSET': 'clang-3.8', 'B2_CXXSTD': '11', 'DRONE_JOB_UUID': '7b52009b64'}),
  linux_cxx("B2_TOOLSET=clang-4.0 B2_CXXSTD=11,14 Job 13", "clang++-4.0", packages="clang-4.0 libstdc++-6-dev", llvm_os="xenial", llvm_ver="4.0", buildtype="boost", environment={'B2_TOOLSET': 'clang-4.0', 'B2_CXXSTD': '11,14', 'DRONE_JOB_UUID': 'bd307a3ec3'}),
  linux_cxx("B2_TOOLSET=clang-5.0 B2_CXXSTD=11,14 Job 14", "clang++-5.0", packages="clang-5.0 libstdc++-7-dev", llvm_os="xenial", llvm_ver="5.0", buildtype="boost", environment={'B2_TOOLSET': 'clang-5.0', 'B2_CXXSTD': '11,14', 'DRONE_JOB_UUID': 'fa35e19212'}),
  linux_cxx("B2_TOOLSET=clang-6.0 B2_CXXSTD=14,17 Job 15", "clang++-6.0", packages="clang-6.0 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="6.0", buildtype="boost", environment={'B2_TOOLSET': 'clang-6.0', 'B2_CXXSTD': '14,17', 'DRONE_JOB_UUID': 'f1abd67035'}),
  linux_cxx("B2_TOOLSET=clang-7 B2_CXXSTD=17 Job 16", "clang++-7", packages="clang-7 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="7", buildtype="boost", environment={'B2_TOOLSET': 'clang-7', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': '1574bddb75'}),
  linux_cxx("B2_TOOLSET=clang-8 B2_CXXSTD=17 Job 17", "clang++-8", packages="clang-8 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="8", buildtype="boost", environment={'B2_TOOLSET': 'clang-8', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': '0716d9708d'}),
  linux_cxx("B2_TOOLSET=clang-9 B2_CXXSTD=11,14,17 Job 18", "clang++-9", packages="clang-9 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="9", buildtype="boost", environment={'B2_TOOLSET': 'clang-9', 'B2_CXXSTD': '11,14,17', 'DRONE_JOB_UUID': '9e6a55b6b4'}),
  linux_cxx("B2_TOOLSET=clang-6.0 B2_CXXSTD=11,14 Job 19", "clang++-6.0", packages="clang-6.0 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="6.0", buildtype="boost", environment={'B2_TOOLSET': 'clang-6.0', 'B2_CXXSTD': '11,14', 'B2_CXXFLAGS': '-stdlib=libc++', 'DRONE_JOB_UUID': 'b3f0c7f6bb'}),
  linux_cxx("COMMENT=Coverity Scan B2_TOOLSET=clang Job 21", "g++", packages="", buildtype="b5847f804b-cce9827eb5", environment={'COMMENT': 'Coverity Scan', 'B2_TOOLSET': 'clang', 'DRONE_JOB_UUID': '472b07b9fc'}),
  linux_cxx("COMMENT=STANDALONE B2_TOOLSET=gcc-7 B2_DEFINE Job 22", "g++-7", packages="g++-7", buildtype="boost", environment={'COMMENT': 'STANDALONE', 'B2_TOOLSET': 'gcc-7', 'B2_DEFINES': 'define=BOOST_STATIC_STRING_STANDALONE', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': '12c6fc06c9'}),
  linux_cxx("COMMENT=STANDALONE B2_TOOLSET=gcc-8 B2_DEFINE Job 23", "g++-8", packages="g++-8", buildtype="boost", environment={'COMMENT': 'STANDALONE', 'B2_TOOLSET': 'gcc-8', 'B2_DEFINES': 'define=BOOST_STATIC_STRING_STANDALONE', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': 'd435a6cdd7'}),
  linux_cxx("COMMENT=STANDALONE B2_TOOLSET=gcc-9 B2_DEFINE Job 24", "g++-9", packages="g++-9", buildtype="boost", environment={'COMMENT': 'STANDALONE', 'B2_TOOLSET': 'gcc-9', 'B2_DEFINES': 'define=BOOST_STATIC_STRING_STANDALONE', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': '4d134bc072'}),
  linux_cxx("COMMENT=STANDALONE B2_TOOLSET=clang-6.0 B2_DE Job 25", "clang++-6.0", packages="clang-6.0 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="6.0", buildtype="boost", environment={'COMMENT': 'STANDALONE', 'B2_TOOLSET': 'clang-6.0', 'B2_DEFINES': 'define=BOOST_STATIC_STRING_STANDALONE', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': 'f6e1126ced'}),
  linux_cxx("COMMENT=STANDALONE B2_TOOLSET=clang-7 B2_DEFI Job 26", "clang++-7", packages="clang-7 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="7", buildtype="boost", environment={'COMMENT': 'STANDALONE', 'B2_TOOLSET': 'clang-7', 'B2_DEFINES': 'define=BOOST_STATIC_STRING_STANDALONE', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': '887309d048'}),
  linux_cxx("COMMENT=STANDALONE B2_TOOLSET=clang-8 B2_DEFI Job 27", "clang++-8", packages="clang-8 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="8", buildtype="boost", environment={'COMMENT': 'STANDALONE', 'B2_TOOLSET': 'clang-8', 'B2_DEFINES': 'define=BOOST_STATIC_STRING_STANDALONE', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': 'bc33ea4e26'}),
  linux_cxx("COMMENT=STANDALONE B2_TOOLSET=clang-9 B2_DEFI Job 28", "clang++-9", packages="clang-9 libc6-dbg libc++-dev libstdc++-8-dev", llvm_os="xenial", llvm_ver="9", buildtype="boost", environment={'COMMENT': 'STANDALONE', 'B2_TOOLSET': 'clang-9', 'B2_DEFINES': 'define=BOOST_STATIC_STRING_STANDALONE', 'B2_CXXSTD': '17', 'DRONE_JOB_UUID': '0a57cb53ba'}),
  ]

# Generate pipeline for Linux platform compilers.
def linux_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
  environment_global = {
      "TRAVIS_BUILD_DIR": "/drone/src",

      "CXX": cxx,
      "CXXFLAGS": cxxflags,
      "PACKAGES": packages,
      "LLVM_OS": llvm_os,
      "LLVM_VER": llvm_ver
      }
  environment_global.update({'B2_VARIANT': 'variant=release'})
  environment_current=environment_global
  environment_current.update(environment)

  return {
    "name": "Linux %s" % name,
    "kind": "pipeline",
    "type": "docker",
    "trigger": { "branch": [ "master","develop", "drone*", "bugfix/*", "feature/*", "fix/*", "pr/*" ] },
    "platform": {
      "os": "linux",
      "arch": arch
    },
    # Create env vars per generation arguments.
    "environment": environment_current,
    "steps": [
      {
        "name": "Everything",
        "image": image,
        "privileged" : privileged,
        "environment": stepenvironment,
        "commands": [

          "echo '==================================> SETUP'",
          "uname -a",
          # Moved to Docker
          # "apt-get -o Acquire::Retries=3 update && DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata && apt-get -o Acquire::Retries=3 install -y sudo software-properties-common wget curl apt-transport-https git make cmake apt-file sudo unzip libssl-dev build-essential autotools-dev autoconf libc++-helpers automake g++",
          # "for i in {1..3}; do apt-add-repository ppa:git-core/ppa && break || sleep 2; done",
          # "apt-get -o Acquire::Retries=3 update && apt-get -o Acquire::Retries=3 -y install git",
          "echo '==================================> PACKAGES'",
          "./.drone/linux-cxx-install.sh",

          "echo '==================================> INSTALL AND COMPILE'",
          "./.drone/%s.sh" % buildtype,
        ]
      }
    ]
  }

def windows_cxx(name, cxx="g++", cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/dronevs2019", buildtype="boost", environment={}, stepenvironment={}, privileged=False):
  environment_global = {
      "CXX": cxx,
      "CXXFLAGS": cxxflags,
      "PACKAGES": packages,
      "LLVM_OS": llvm_os,
      "LLVM_VER": llvm_ver
    }
  environment_global.update({'B2_VARIANT': 'variant=release'})
  environment_current=environment_global
  environment_current.update(environment)

  return {
    "name": "Windows %s" % name,
    "kind": "pipeline",
    "type": "docker",
    "trigger": { "branch": [ "master","develop", "drone*", "bugfix/*", "feature/*", "fix/*", "pr/*" ] },
    "platform": {
      "os": "windows",
      "arch": arch
    },
    # Create env vars per generation arguments.
    "environment": environment_current,
    "steps": [
      {
        "name": "Everything",
        "image": image,
        "privileged": privileged,
        "environment": stepenvironment,
        "commands": [
          "echo '==================================> SETUP'",
          "echo '==================================> PACKAGES'",
          "bash.exe ./.drone/windows-msvc-install.sh",

          "echo '==================================> INSTALL AND COMPILE'",
          "bash.exe ./.drone/%s.sh" % buildtype,
        ]
      }
    ]
  }
def osx_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
    pass

def freebsd_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
    pass
