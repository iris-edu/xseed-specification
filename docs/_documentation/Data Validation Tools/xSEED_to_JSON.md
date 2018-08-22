---
layout: documentation
category: Data Validation Tools
order: 4
title: xSEED to JSON
---

## Introduction

xSEED to JSON is a program that prints the contents of a selected xSEED file in JSON format. This program optionally prints record payloads via verbosity level 2 or higher.

## Help

xSEED to JSON usage information:

```
Program to print an xSEED file in JSON format:

Usage: ./xseed2json [options] infile(s)

         ## Options ##
     -h help    Display usage information
     -v verbose Verbosity level
     -d data    Print data payload
```

## Typical Usage

```
./xseed2json <xSEED input file>
add -v for verbosity, add vs for more verbose
```

## Example Usage

```
xseed-utils/bin/xseed2text xseed-utils/share/ref_datasets/reference-baseline-record-sinusoid-steim2.xseed
```
## Example Usage Output
```
{
    "tsid": "XFDSN:XX_TEST__L_H_Z",
    "pubversion": 1,
    "reclen": 3,
    "starttime": "2012,001,00:00:00.000000",
    "samplecnt": 500,
    "samprate": 1,
    "flags": 0,
    "crc": "0x2182448F",
    "extralength": 0,
    "datalength": 896,
    "encoding": "STEIM 2 Compression",
    "encodingval": 11
}
```
