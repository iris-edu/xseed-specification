#!/bin/bash
#
# Build reference data using miniSEED 2 data records, as a baseline,
# and mseedconvert with extra header JSON injection.

# Event detection, extra headers only
echo Building reference-detectiononly.xseed
mseedconvert baseline-record-detectiononly.mseed -o reference-detectiononly.xseed
xseed2json -d reference-detectiononly.xseed > reference-detectiononly.json
xseed2text -d reference-detectiononly.xseed > reference-detectiononly.txt

# ASCII data
echo Building reference-ascii.xseed
mseedconvert baseline-record-ascii.mseed -o reference-ascii.xseed
xseed2json -d reference-ascii.xseed > reference-ascii.json
xseed2text -d reference-ascii.xseed > reference-ascii.txt

# 16-bit integer data
echo Building reference-sinusoid-int16.xseed
mseedconvert baseline-record-sinusoid-400.mseed -E 1 -o reference-sinusoid-int16.xseed
xseed2json -d reference-sinusoid-int16.xseed > reference-sinusoid-int16.json
xseed2text -d reference-sinusoid-int16.xseed > reference-sinusoid-int16.txt

# 32-bit integer data
echo Building reference-sinusoid-int32.xseed
mseedconvert baseline-record-sinusoid.mseed -E 3 -o reference-sinusoid-int32.xseed
xseed2json -d reference-sinusoid-int32.xseed > reference-sinusoid-int32.json
xseed2text -d reference-sinusoid-int32.xseed > reference-sinusoid-int32.txt

# 32-bit float data
echo Building reference-sinusoid-float32.xseed
mseedconvert baseline-record-sinusoid.mseed -E 4 -o reference-sinusoid-float32.xseed
xseed2json -d reference-sinusoid-float32.xseed > reference-sinusoid-float32.json
xseed2text -d reference-sinusoid-float32.xseed > reference-sinusoid-float32.txt

# 64-bit float data
echo Building reference-sinusoid-float64.xseed
mseedconvert baseline-record-sinusoid.mseed -E 5 -o reference-sinusoid-float64.xseed
xseed2json -d reference-sinusoid-float64.xseed > reference-sinusoid-float64.json
xseed2text -d reference-sinusoid-float64.xseed > reference-sinusoid-float64.txt

# Steim-1 compressed data
echo Building reference-sinusoid-steim1.xseed
mseedconvert baseline-record-sinusoid.mseed -E 10 -o reference-sinusoid-steim1.xseed
xseed2json -d reference-sinusoid-steim1.xseed > reference-sinusoid-steim1.json
xseed2text -d reference-sinusoid-steim1.xseed > reference-sinusoid-steim1.txt

# Steim-2 compressed data
echo Building reference-sinusoid-steim2.xseed
mseedconvert baseline-record-sinusoid.mseed -E 11 -o reference-sinusoid-steim2.xseed
xseed2json -d reference-sinusoid-steim2.xseed > reference-sinusoid-steim2.json
xseed2text -d reference-sinusoid-steim2.xseed > reference-sinusoid-steim2.txt

# Steim-2 compressed data, with time quality, correction, and event detections
echo Building reference-sinusoid-TQ-TC-ED.xseed
mseedconvert baseline-record-sinusoid.mseed -E 11 -eh ExtraHeader-TQ-TC-ED.json -o reference-sinusoid-TQ-TC-ED.xseed
xseed2json -d reference-sinusoid-TQ-TC-ED.xseed > reference-sinusoid-TQ-TC-ED.json
xseed2text -d reference-sinusoid-TQ-TC-ED.xseed > reference-sinusoid-TQ-TC-ED.txt

# Steim-2 compressed data, with FDSN and non-FDSN extra headers
echo Building reference-sinusoid-FDSN-Other.xseed
mseedconvert baseline-record-sinusoid.mseed -E 11 -eh ExtraHeader-FDSN-Other.json -o reference-sinusoid-FDSN-Other.xseed
xseed2json -d reference-sinusoid-FDSN-Other.xseed > reference-sinusoid-FDSN-Other.json
xseed2text -d reference-sinusoid-FDSN-Other.xseed > reference-sinusoid-FDSN-Other.txt

# Steim-2 compressed data, with all FDSN extra headers
echo Building reference-sinusoid-FDSN-All.xseed
mseedconvert baseline-record-sinusoid.mseed -E 11 -eh ExtraHeader-FDSN-All.json -o reference-sinusoid-FDSN-All.xseed
xseed2json -d reference-sinusoid-FDSN-All.xseed > reference-sinusoid-FDSN-All.json
xseed2text -d reference-sinusoid-FDSN-All.xseed > reference-sinusoid-FDSN-All.txt

