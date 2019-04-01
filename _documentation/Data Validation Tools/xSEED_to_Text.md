---
layout: documentation
category: Data Validation Tools
order: 5
title: xSEED to Text
---

## Introduction

xSEED to Text is a program that prints the contents of a selected xSEED file in human readable format. This program optionally prints record payloads via verbosity level 2 or higher, using a format supplied by libmseed's msr_print function.

## Help

xSEED to Text usage information:

```
Program to print an xSEED file in human readable format:

Usage: ./xseed2text [options] infile(s)

         ## Options ##
     -h help    Display usage information
     -v verbose Verbosity level
     -d data    Print data payload
```

## Typical Usage
```
./xseed2text <xSEED input file>
add -v for verbosity level, add vs for more verbose
```

## Example Usage
```
xseed-utils/bin/xseed2text xseed-utils/share/ref_datasets/reference-baseline-record-sinusoid-steim2.xseed
```
## Example Usage Output
```
XFDSN:XX_TEST__L_H_Z, 1, 956 (format: 3)
             start time: 2012,001,00:00:00.000000
      number of samples: 500
       sample rate (Hz): 1
                    CRC: 0x2182448F
    extra header length: 0 bytes
    data payload length: 896 bytes
    payload encoding: STEIM 2 Compression (val: 11)       
```