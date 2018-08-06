---
layout: documentation
category: Data Validation Tools
order: 5
title: xSEED to Text
---

## Introduction

xSEED to Text prints the contents of a selected xSEED file in text format to the terminal.

## Help

xSEED to Text usage information:

```
Program to print an xSEED file in human readable format:

Usage: ./xseed2text [options] -f infile

         ## Options ##
     -h help    Display usage information
     -f file    File to print
     -v verbose Verbosity level
```

## Typical Usage
```
./xseed2text <xSEED input file>
add -v for verbosity level, add vs for more verbose
```


## Example Usage
```
./xseed2text -f reference-baseline-record-steim2.mseed3 -vvv
```