---
permalink: /specification/extraheaders/
title: Extra Header specification
toc: true
sidebar:
  nav: "specification-sidebar"
---

Extra headers are encoded in the JSON Data Interchange Standard as
defined by ​[ECMA-404](https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf)​.
All extra headers are optional as far as the format is concerned.

Note, extra headers are stored in _compact_ (or minimized) JSON, that
is, without unnecessary space or new line characters.

Extra headers must follow these rules:

* All extra headers are contained in an anonymous (unnamed) object
* All entries are key-value pairs where values can be any valid JSON type
* The key value of “FDSN” in the root object is reserved for values defined by the FDSN

### FDSN reserved headers

The key named “FDSN” with value of an JSON object in the root container of the extra headers is
reserved for definition by the FDSN.  The documentation and schema of these headers are specified
in JSON Schema here:

[FDSN Reserved Extra Header Schema](../../ExtraHeaders/ExtraHeaders-FDSN.schema.json)

When not present, the boolean values in the FDSN reserved headers should be considered to be ​false
unless otherwise documented. Such values do not need to be included when the value is ​false.​

### Extension and examples

Extra headers may be defined by equipment manufacturers, network
operators, data centers, etc.  See the full specification document for
a guidelines on creating new extra headers and examples.

### Simple example

Simple Extra Header set with the single `FDSN.Time.Quality` header set:

{% highlight javascript %}
{
    "FDSN": {
        "Time": {
            "Quality": 90
        }
    }
}
{% endhighlight %}


### Example FDSN and other headers

Example of FDSN combined with extra headers from fictional
"Manufacturer123" and "OperatorXYZ".

{% highlight javascript %}
{
    "FDSN": {
        "Time": {
            "Quality": 90
        }
    },
    "Manufacturer123": {
        "Metadata": {
            "FilamentCurrent": 16.4,
            "HyperCoordinates": "1.1789:965402:73324@3.14159"
        }
    },
    "OperatorXYZ": {
        "DSP": {
            "PeakRMS": 2067,
            "RMSWindow": 10.5
        }
    }
}
{% endhighlight %}

### Full FDSN example

An illustrative example of all FDSN Extra Headers

{% highlight javascript %}
{
    "FDSN": {
        "Time": {
            "Quality": 100,
            "Correction": 1.234,
            "MaxEstimatedError": 0.000001,
            "LeapSecond": 1,
            "Exception": [
                {
                    "Time": "2012-01-13T18:46:36Z",
                    "VCOCorrection": 50.7812,
                    "ReceptionQuality": 80,
                    "Count": 23,
                    "Type": "Valid Timemark",
                    "ClockStatus": "SNR=48,51,51,50,50,48,46,48,48,45,45"
                },
                {
                    "Time": "2012-01-13T18:48:12.7654Z",
                    "VCOCorrection": 44.1313,
                    "ReceptionQuality": 55,
                    "Count": 19690,
                    "Type": "Missing timemarks",
                    "ClockStatus": "SNR=50,48,46,48,48,45,45"
                }
            ]
        },
        "Event": {
            "Begin": true,
            "End": true,
            "InProgress": true,
            "Detection": [
                {
                    "Type": "GENERIC",
                    "SignalAmplitude": 80,
                    "SignalPeriod": 0.4,
                    "BackgroundEstimate": 18,
                    "OnsetTime": "2012-01-13T18:28:06.185000Z",
                    "Detector": "Dalek STA/LTA"
                },
                {
                    "Type": "MURDOCK",
                    "SignalAmplitude": 80,
                    "SignalPeriod": 0.4,
                    "BackgroundEstimate": 18,
                    "Wave": "DILATATION",
                    "Units": "COUNTS",
                    "OnsetTime": "2012-01-13T18:28:06.185000Z",
                    "MEDSNR": [1, 3, 2, 1, 4, 0],
                    "MEDLookback": 2,
                    "MEDPickAlgorithm": 0,
                    "Detector": "Z_SPWWSS"
                }
            ]
        },
        "Calibration": {
            "Sequence": [
                {
                    "Type": "Step",
                    "BeginTime": "2012-01-13T18:28:06.185000Z",
                    "Steps": 12,
                    "StepFirstPulsePositive": true,
                    "StepAlternateSign": true,
                    "Trigger": "AUTOMATIC",
                    "Continued": false,
                    "Amplitude": 1345,
                    "InputUnits": "COUNTS",
                    "Duration": 603.456,
                    "SinePeriod": 5.0,
                    "StepBetween": 500.0,
                    "InputChannel": "CAL",
                    "ReferenceAmplitude": 45.8,
                    "Coupling": "RESISTIVE",
                    "Rolloff": "Description of rolloff"
                },
                {
                    "Type": "Step",
                    "EndTime": "2012-01-13T18:28:16.185000Z"
                },
                {
                    "Type": "Sine",
                    "BeginTime": "2012-01-13T18:28:06.185000Z",
                    "EndTime": "2012-01-13T18:28:06.185000Z",
                    "Trigger": "MANUAL",
                    "Continued": true,
                    "Amplitude": 1345,
                    "InputUnits": "COUNTS",
                    "AmplitudeRange": "PEAKTOPEAK",
                    "SinePeriod": 5.0,
                    "InputChannel": "CAL",
                    "ReferenceAmplitude": 45.8,
                    "Coupling": "RESISTIVE",
                    "Rolloff": "Description of rolloff"
                },
                {
                    "Type": "PseudoRandom",
                    "BeginTime": "2012-01-13T18:28:06.185000Z",
                    "EndTime": "2012-01-13T18:28:06.185000Z",
                    "Trigger": "MANUAL",
                    "Amplitude": 0.0001,
                    "InputUnits": "M/S",
                    "Duration": 300,
                    "InputChannel": "CAL",
                    "ReferenceAmplitude": 45.8,
                    "Coupling": "CAPACITIVE",
                    "Rolloff": "Very randomly",
                    "Noise": "White"
                },
                {
                    "Type": "Generic",
                    "BeginTime": "2012-01-13T18:28:06.185000Z",
                    "EndTime": "2012-01-13T18:28:06.185000Z",
                    "Trigger": "MANUAL",
                    "Amplitude": 1345,
                    "Duration": 100
                }
            ]
        },
        "Recenter": {
            "Sequence": [
                {
                    "Type": "Gimbal",
                    "BeginTime": "2012-01-13T18:27:06.185000Z",
                    "EndTime": "2012-01-13T18:27:16.185000Z",
                    "Trigger": "AUTOMATIC"
                },
                {
                    "BeginTime": "2012-01-13T18:28:06.185000Z"
                }
            ]
        },
        "Flags": {
            "MassPositionOffscale": true,
            "AmplifierSaturation": true,
            "DigitizerClipping": true,
            "Spikes": true,
            "Glitches": true,
            "FilterCharging": true,
            "StationVolumeParityError": true,
            "LongRecordRead": true,
            "ShortRecordRead": true,
            "StartOfTimeSeries": true,
            "EndOfTimeSeries": true,
            "MissingData": true,
            "TelemetrySyncError": true
        },
        "Logger": {
            "Model": "DM24",
            "Serial": "A4567"
        },
        "Sensor": {
            "Model": "T240",
            "Serial": "123123"
        },
        "Clock": {
            "Model": "P273T11N16",
            "Serial": "24A00000"
        },
        "ProvenanceURI": "prov:sp001_wf_f84fb9a",
        "DataQuality": "D",
        "Sequence": 123456
    }
}
{% endhighlight %}
