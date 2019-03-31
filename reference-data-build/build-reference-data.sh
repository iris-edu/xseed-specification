#!/bin/bash
#
# Build reference data using miniSEED 2 data records, as a baseline,
# and mseedconvert with extra header JSON injection.

# Event detection, extra headers only
mseedconvert baseline-record-detectiononly.mseed -o reference-detectiononly.xseed

# ASCII data
mseedconvert baseline-record-ascii.mseed -o reference-ascii.xseed

# 16-bit integer data
mseedconvert baseline-record-sinusoid.mseed -R 1 -o reference-sinusoid-int16.xseed

# 32-bit integer data
mseedconvert baseline-record-sinusoid.mseed -R 3 -o reference-sinusoid-int32.xseed

# 32-bit float data
mseedconvert baseline-record-sinusoid.mseed -R 4 -o reference-sinusoid-float32.xseed

# 64-bit float data
mseedconvert baseline-record-sinusoid.mseed -R 5 -o reference-sinusoid-float64.xseed

# Steim-1 compressed data
mseedconvert baseline-record-sinusoid.mseed -R 10 -o reference-sinusoid-steim1.xseed

# Steim-2 compressed data
mseedconvert baseline-record-sinusoid.mseed -R 11 -o reference-sinusoid-steim2.xseed

# Steim-2 compressed data, with time quality, correction, and event detections
mseedconvert baseline-record-sinusoid.mseed -R 11 -eh ExtraHeader-TQ-TC-ED.json -o reference-sinusoid-TQ-TC-ED.xseed

# Steim-2 compressed data, with FDSN and non-FDSN extra headers
mseedconvert baseline-record-sinusoid.mseed -R 11 -eh ExtraHeader-FDSN-Plus.json -o reference-sinusoid-FDSN-Plus.xseed

# Steim-2 compressed data, with all FDSN extra headers
mseedconvert baseline-record-sinusoid.mseed -R 11 -eh ExtraHeader-FDSN-All.json -o reference-sinusoid-FDSN-All.xseed
