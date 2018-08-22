---
layout: documentation
category: Data Validation Tools
order: 1
title: Installation
---

## Dependencies
Dependencies include:

- cmake >= 2.8.0
- libmseed >= 3.0
- WJElement > 1.3

**_Note:_** *libmseed and WJElement are automatically installed via make.*

## Supported Platforms
Supported platforms include:

- Linux
- MacOS
- Windows

## Clone/Configure Project

- ```git clone https://gitlab.isti.com/xSEED/xseed-utils.git```
- ```cd xseed-utils```
- ```mkdir build/```
- ```cd build/```
- Run ```cmake ..```

**_Note:_** *To specify install prefix,  use:*
    cmake -DCMAKE_INSTALL_PREFIX:PATH={user specified path} ..

## Build/Install Instructions

To build and install the utilities that convert and verify the xSEED standard for miniSEED files, follow the platform-specific instructions below: 

### Linux/MacOS

1. Run  ```make```

   **_Note:_** *An Internet connection is required to pull and build supporting libraries (see Dependencies, above).*

2. (Optional) Run ```make install``` to install in system or location specified by ```-DCMAKE_INSTALL_PREFIX:PATH```

### Windows
Run ```MSBuild xseed-utils.sln```
