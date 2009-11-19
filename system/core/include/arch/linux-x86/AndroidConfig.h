/*
 * Copyright (C) 2005 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Android config -- "Linux".  Used for desktop x86 Linux.
 */
#ifndef _ANDROID_CONFIG_H
#define _ANDROID_CONFIG_H

/*
 * ===========================================================================
 *                              !!! IMPORTANT !!!
 * ===========================================================================
 *
 * This file is included by ALL C/C++ source files.  Don't put anything in
 * here unless you are absolutely certain it can't go anywhere else.
 *
 * Any C++ stuff must be wrapped with "#ifdef __cplusplus".  Do not use "//"
 * comments.
 */

/*
 * Threading model.  Choose one:
 *
 * HAVE_PTHREADS - use the pthreads library.
 * HAVE_WIN32_THREADS - use Win32 thread primitives.
 *  -- combine HAVE_CREATETHREAD, HAVE_CREATEMUTEX, and HAVE__BEGINTHREADEX
 */
#define HAVE_PTHREADS 1

/*
 * Do we have the futex syscall?
 */

#define HAVE_FUTEX 1

/*
 * Process creation model.  Choose one:
 *
 * HAVE_FORKEXEC - use fork() and exec()
 * HAVE_WIN32_PROC - use CreateProcess()
 */
#define HAVE_FORKEXEC 1

/*
 * Process out-of-memory adjustment.  Set if running on Linux,
 * where we can write to /proc/<pid>/oom_adj to modify the out-of-memory
 * badness adjustment.
 */
#define HAVE_OOM_ADJ 1

/*
 * IPC model.  Choose one:
 *
 * HAVE_SYSV_IPC - use the classic SysV IPC mechanisms (semget, shmget).
 * HAVE_MACOSX_IPC - use Macintosh IPC mechanisms (sem_open, mmap).
 * HAVE_WIN32_IPC - use Win32 IPC (CreateSemaphore, CreateFileMapping).
 * HAVE_ANDROID_IPC - use Android versions (?, mmap).
 */
#define HAVE_SYSV_IPC 1

/*
 * Memory-mapping model. Choose one:
 *
 * HAVE_POSIX_FILEMAP - use the Posix sys/mmap.h
 * HAVE_WIN32_FILEMAP - use Win32 filemaps
 */
#define  HAVE_POSIX_FILEMAP 1

/*
 * Define this if you have <termio.h>
 */
#define  HAVE_TERMIO_H 1

/*
 * Define this if you build against MSVCRT.DLL
 */
/* #define HAVE_MS_C_RUNTIME */

/*
 * Define this if you have sys/uio.h
 */
#define  HAVE_SYS_UIO_H 1

/*
 * Define this if your platforms implements symbolic links
 * in its filesystems
 */
#define HAVE_SYMLINKS 1

/*
 * Define this if we have localtime_r().
 */
#define HAVE_LOCALTIME_R 1

/*
 * Define this if we have gethostbyname_r().
 */
#define HAVE_GETHOSTBYNAME_R 1

/*
 * Define this if we have ioctl().
 */
#define HAVE_IOCTL 1

/*
 * Define this if we want to use WinSock.
 */
/* #define HAVE_WINSOCK */

/*
 * Define this if have clock_gettime() and friends
 *
 * Desktop Linux has this in librt, but it's broken in goobuntu, yielding
 * mildly or wildly inaccurate results.
 */
#define HAVE_POSIX_CLOCKS 1

/*
 * Define this if we have pthread_cond_timedwait_monotonic() and
 * clock_gettime(CLOCK_MONOTONIC).
 */
#define HAVE_TIMEDWAIT_MONOTONIC 1

/*
 * Define this if we have linux style epoll()
 */
#define HAVE_EPOLL 1

/*
 * Endianness of the target machine.  Choose one:
 *
 * HAVE_ENDIAN_H -- have endian.h header we can include.
 * HAVE_LITTLE_ENDIAN -- we are little endian.
 * HAVE_BIG_ENDIAN -- we are big endian.
 */
#define HAVE_ENDIAN_H 1
#define HAVE_LITTLE_ENDIAN 1

/*
 * We need to choose between 32-bit and 64-bit off_t.  All of our code should
 * agree on the same size.  For desktop systems, use 64-bit values,
 * because some of our libraries (e.g. wxWidgets) expect to be built that way.
 */
#define _FILE_OFFSET_BITS 64
#define _LARGEFILE_SOURCE 1

/*
 * Defined if we have the backtrace() call for retrieving a stack trace.
 * Needed for CallStack to operate; if not defined, CallStack is
 * non-functional.
 */
#define HAVE_BACKTRACE 1

/*
 * Defined if we have the dladdr() call for retrieving the symbol associated
 * with a memory address.  If not defined, stack crawls will not have symbolic
 * information.
 */
#define HAVE_DLADDR 1

/*
 * Defined if we have the cxxabi.h header for demangling C++ symbols.  If
 * not defined, stack crawls will be displayed with raw mangled symbols
 */
#define HAVE_CXXABI 0

/*
 * Defined if we have the gettid() system call.
 */
#define HAVE_GETTID 1

/* 
 * Defined if we have the sched_setscheduler() call
 */
#define HAVE_SCHED_SETSCHEDULER 1

/*
 * Add any extra platform-specific defines here.
 */
//#define __linux__

/*
 * Define if we have <malloc.h> header
 */
#define HAVE_MALLOC_H 1

/* 
 * Define if we're running on *our* linux on device or emulator.
 */
#define HAVE_ANDROID_OS 1

/*
 * Define if we have Linux-style non-filesystem Unix Domain Sockets
 */

/*
 * What CPU architecture does this platform use?
 */
#define ARCH_X86 1


/*
 * Define if we have Linux's inotify in <sys/inotify.h>.
 */
#define HAVE_INOTIFY 1

/*
 * Define if we have madvise() in <sys/mman.h>
 */
#define HAVE_MADVISE 1

/*
 * Define if tm struct has tm_gmtoff field
 */
#define HAVE_TM_GMTOFF 1

/*
 * Define if dirent struct has d_type field
 */
#define HAVE_DIRENT_D_TYPE 1

/*
 * Define if libc includes Android system properties implementation.
 */
/* #define HAVE_LIBC_SYSTEM_PROPERTIES */

/*
 * Define if system provides a system property server (should be
 * mutually exclusive with HAVE_LIBC_SYSTEM_PROPERTIES).
 */
#define HAVE_SYSTEM_PROPERTY_SERVER 1

/*
 * sprintf() format string for shared library naming.
 */
#define OS_SHARED_LIB_FORMAT_STR    "lib%s.so"

/*
 * type for the third argument to mincore().
 */
#define MINCORE_POINTER_TYPE unsigned char *

/*
 * Do we have the sigaction flag SA_NOCLDWAIT?
 */
#define HAVE_SA_NOCLDWAIT 1

/*
 * The default path separator for the platform
 */
#define OS_PATH_SEPARATOR '/'

/*
 * Is the filesystem case sensitive?
 */
#define OS_CASE_SENSITIVE 1

/*
 * Define if <sys/socket.h> exists.
 */
#define HAVE_SYS_SOCKET_H 1

/*
 * Define if the strlcpy() function exists on the system.
 */
/*#define HAVE_STRLCPY 1 */

/*
 * Define if prctl() exists
 */
#define HAVE_PRCTL 1

/*
 * Define if writev() exists
 */
#define HAVE_WRITEV 1

#endif /*_ANDROID_CONFIG_H*/
