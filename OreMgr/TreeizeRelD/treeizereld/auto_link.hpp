/* -*- mode: c++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */

#ifndef treeizereld_autolink_hpp
#define treeizereld_autolink_hpp

#include <boost/config.hpp>

// select toolset:
#if (_MSC_VER < 1310)
#error "unsupported Microsoft compiler"
#elif(_MSC_VER == 1310)
#define TREEIZE_RELD_LIB_TOOLSET "vc71"
#elif(_MSC_VER == 1400)
#define TREEIZE_RELD_LIB_TOOLSET "vc80"
#elif(_MSC_VER == 1500)
#ifdef x64
#define TREEIZE_RELD_LIB_TOOLSET "vc90-x64"
#else
#define TREEIZE_RELD_LIB_TOOLSET "vc90"
#endif
#elif(_MSC_VER == 1600)
#define TREEIZE_RELD_LIB_TOOLSET "vc100"
#elif(_MSC_VER == 1700)
#define TREEIZE_RELD_LIB_TOOLSET "vc110"
#elif(_MSC_VER == 1800)
#define TREEIZE_RELD_LIB_TOOLSET "vc120"
#elif(_MSC_VER == 1900)
#define TREEIZE_RELD_LIB_TOOLSET "vc140"
#else
#define TREEIZE_RELD_LIB_TOOLSET "vc141"
#endif

#ifdef _M_X64
#define TREEIZE_RELD_LIB_PLATFORM "-x64"
#else
#define TREEIZE_RELD_LIB_PLATFORM
#endif

/*** libraries to be linked ***/

// select thread opt:
#ifdef _MT
#define TREEIZE_RELD_LIB_THREAD_OPT "-mt"
#else
#define TREEIZE_RELD_LIB_THREAD_OPT
#endif

// select linkage opt:
#ifdef _DLL
#if defined(_DEBUG)
#define TREEIZE_RELD_LIB_RT_OPT "-gd"
#else
#define TREEIZE_RELD_LIB_RT_OPT
#endif
#else
#if defined(_DEBUG)
#define TREEIZE_RELD_LIB_RT_OPT "-sgd"
#else
#define TREEIZE_RELD_LIB_RT_OPT "-s"
#endif
#endif

#define TREEIZE_RELD_LIB_NAME                                                                               \
    "OREAnalytics-" TREEIZE_RELD_LIB_TOOLSET TREEIZE_RELD_LIB_PLATFORM                \
        TREEIZE_RELD_LIB_THREAD_OPT TREEIZE_RELD_LIB_RT_OPT ".lib"

#pragma comment(lib, TREEIZE_RELD_LIB_NAME)
#ifdef BOOST_LIB_DIAGNOSTIC
#pragma message("Will (need to) link to lib file: " TREEIZE_RELD_LIB_NAME)
#endif

#endif
