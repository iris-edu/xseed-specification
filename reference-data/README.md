---
permalink: /reference-data
title: Reference data set
toc: false
layout: single
---

The reference data set is intended as an illustration of properly
constructed xSEED and to be used by software implementors during
development and testing.

The set contains multiple examples of xSEED data records illustrating
different characteristics and data encodings of the from.  Each
example is available in xSEED, JSON, and human-readable text
representations.

The whole data set may be [downloaded from project repository](https://github.com/iris-edu/xseed-specification/tree/master/reference-data).

## Reference data files

All time series in the reference set that contain series are
the same expanding sinusoid signal.

| #  | Description                                                     | Download                     |
| -- | --------------------------------------------------------------- | ---------------------------- |
| 1  | Text encoded as ASCII                                           | [xSEED](reference-ascii.xseed) [JSON](reference-ascii.json) [Text](reference-ascii.txt) |
| 2  | Event detection headers only, no data payload                   | [xSEED](reference-detectiononly.xseed) [JSON](reference-detectiononly.json) [Text](reference-detectiononly.txt) |
| 3  | Sinusoid series encoded as 16-bit integers                      | [xSEED](reference-sinusoid-int16.xseed) [JSON](reference-sinusoid-int16.json) [Text](reference-sinusoid-int16.txt) |
| 4  | Sinusoid series encoded as 32-bit integers                      | [xSEED](reference-sinusoid-int32.xseed) [JSON](reference-sinusoid-int32.json) [Text](reference-sinusoid-int32.txt) |
| 5  | Sinusoid series encoded as 32-bit IEEE float                    | [xSEED](reference-sinusoid-float32.xseed) [JSON](reference-sinusoid-float32.json) [Text](reference-sinusoid-float32.txt) |
| 6  | Sinusoid series encoded as 64-bit IEEE float                    | [xSEED](reference-sinusoid-float64.xseed) [JSON](reference-sinusoid-float64.json) [Text](reference-sinusoid-float64.txt) |
| 7  | Sinusoid series encoded as Steim-1 compressed integers          | [xSEED](reference-sinusoid-steim1.xseed) [JSON](reference-sinusoid-steim1.json) [Text](reference-sinusoid-steim1.txt) |
| 8  | Sinusoid series encoded as Steim-2 compressed integers          | [xSEED](reference-sinusoid-steim2.xseed) [JSON](reference-sinusoid-steim2.json) [Text](reference-sinusoid-steim2.txt) |
| 9  | Series with FDSN time quality, correction, and event detections headers | [xSEED](reference-sinusoid-TQ-TC-ED.xseed) [JSON](reference-sinusoid-TQ-TC-ED.json) [Text](reference-sinusoid-TQ-TC-ED.txt) |
| 10 | Series with some FDSN and non-FDSN extra headers                | [xSEED](reference-sinusoid-FDSN-Other.xseed) [JSON](reference-sinusoid-FDSN-Other.json) [Text](reference-sinusoid-FDSN-Other.txt) |
| 11 | Series with all FDSN extra headers (unrealistic)                | [xSEED](reference-sinusoid-FDSN-All.xseed) [JSON](reference-sinusoid-FDSN-All.json) [Text](reference-sinusoid-FDSN-All.txt) |
