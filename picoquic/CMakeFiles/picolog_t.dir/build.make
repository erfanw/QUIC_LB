# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/sf_shared/picoquic

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/sf_shared/picoquic

# Include any dependencies generated for this target.
include CMakeFiles/picolog_t.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/picolog_t.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/picolog_t.dir/flags.make

CMakeFiles/picolog_t.dir/picolog/picolog.c.o: CMakeFiles/picolog_t.dir/flags.make
CMakeFiles/picolog_t.dir/picolog/picolog.c.o: picolog/picolog.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/sf_shared/picoquic/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/picolog_t.dir/picolog/picolog.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/picolog_t.dir/picolog/picolog.c.o   -c /media/sf_shared/picoquic/picolog/picolog.c

CMakeFiles/picolog_t.dir/picolog/picolog.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/picolog_t.dir/picolog/picolog.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/sf_shared/picoquic/picolog/picolog.c > CMakeFiles/picolog_t.dir/picolog/picolog.c.i

CMakeFiles/picolog_t.dir/picolog/picolog.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/picolog_t.dir/picolog/picolog.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/sf_shared/picoquic/picolog/picolog.c -o CMakeFiles/picolog_t.dir/picolog/picolog.c.s

CMakeFiles/picolog_t.dir/picolog/picolog.c.o.requires:

.PHONY : CMakeFiles/picolog_t.dir/picolog/picolog.c.o.requires

CMakeFiles/picolog_t.dir/picolog/picolog.c.o.provides: CMakeFiles/picolog_t.dir/picolog/picolog.c.o.requires
	$(MAKE) -f CMakeFiles/picolog_t.dir/build.make CMakeFiles/picolog_t.dir/picolog/picolog.c.o.provides.build
.PHONY : CMakeFiles/picolog_t.dir/picolog/picolog.c.o.provides

CMakeFiles/picolog_t.dir/picolog/picolog.c.o.provides.build: CMakeFiles/picolog_t.dir/picolog/picolog.c.o


# Object files for target picolog_t
picolog_t_OBJECTS = \
"CMakeFiles/picolog_t.dir/picolog/picolog.c.o"

# External object files for target picolog_t
picolog_t_EXTERNAL_OBJECTS =

picolog_t: CMakeFiles/picolog_t.dir/picolog/picolog.c.o
picolog_t: CMakeFiles/picolog_t.dir/build.make
picolog_t: libpicoquic-log.a
picolog_t: libpicoquic-core.a
picolog_t: /media/sf_shared/picotls/libpicotls-core.a
picolog_t: /media/sf_shared/picotls/libpicotls-openssl.a
picolog_t: /usr/lib/x86_64-linux-gnu/libssl.so
picolog_t: /usr/lib/x86_64-linux-gnu/libcrypto.so
picolog_t: CMakeFiles/picolog_t.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/sf_shared/picoquic/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable picolog_t"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/picolog_t.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/picolog_t.dir/build: picolog_t

.PHONY : CMakeFiles/picolog_t.dir/build

CMakeFiles/picolog_t.dir/requires: CMakeFiles/picolog_t.dir/picolog/picolog.c.o.requires

.PHONY : CMakeFiles/picolog_t.dir/requires

CMakeFiles/picolog_t.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/picolog_t.dir/cmake_clean.cmake
.PHONY : CMakeFiles/picolog_t.dir/clean

CMakeFiles/picolog_t.dir/depend:
	cd /media/sf_shared/picoquic && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/sf_shared/picoquic /media/sf_shared/picoquic /media/sf_shared/picoquic /media/sf_shared/picoquic /media/sf_shared/picoquic/CMakeFiles/picolog_t.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/picolog_t.dir/depend

