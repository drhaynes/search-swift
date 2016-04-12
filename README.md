# OSSearch
Framework and sample application for using OS search APIs from Swift and
Objective-C, including [OS Places](https://apidocs.os.uk/docs/os-places-overview)
and [OS Open Names](https://apidocs.os.uk/docs/os-names-overview)

[![Coverage Status](https://coveralls.io/repos/github/OrdnanceSurvey/search-swift/badge.svg?branch=master)](https://coveralls.io/github/OrdnanceSurvey/search-swift?branch=master)

[![Circle CI](https://circleci.com/gh/OrdnanceSurvey/search-swift.svg?style=svg)](https://circleci.com/gh/OrdnanceSurvey/search-swift)

### Getting Started
You will need an API key from Ordnance Survey to use this sample.
```
printf "your-api-key" > APIKEY
```
Please ensure your APIKEY file doesn't have a trailing new line.

### Using in your own project
Easiest way to use this framework is using carthage. Add
```
github "OrdnanceSurvey/search-swift"
```
to your Cartfile

### Usage
The framework is usable from both Objective-C and from Swift. If using
Objective-C, use the `OS` prefixed `SearchService` classes, from Swift, use the
versions without prefixes.

## OS Places
OS Places can be accessed using `PlacesSearchService`. Simply instantiate with
your api key, and then call either the `find` function

```
searchService.find("Ordnance Survey") { result in
  switch result {
  case .Success(let response):
    print("\(response.results.first?.address")
  case .Failure(let error):
    print("\(error)")
  }
}
```

or the `nearest` function

```
searchService.nearest(OSGridPoint(easting: 437283, northing: 115391)) { result in
  switch result {
  case .Success(let response):
    print("\(response.results.first?.address")
  case .Failure(let error):
    print("\(error)")
  }
}
```

Note, all geometry values are currently expected in BNG grid points. Use the
functions in [OSTransformations.framework](https://github.com/OrdnanceSurvey/ostransformation-ios)
to convert to and from WGS84 coordinates should that be required.

## OS Open Names
OS Open Names can be accessed using `OpenNamesSearchService`. This works exactly
the same as the OS Places service, except with an additional function that can
limit results to a supplied bounding box:

```
let gridPoint = OSGridPoint(easting: 437000, northing: 115000)
let distance = OSGridSize(width: 1000, height: 1000)
let boundingBox = OSGridRect(originSW: gridPoint, size: distance)
searchService.find("Ordnance Survey", boundingBox: boundingBox) { result in
  switch result {
  case .Success(let response):
    print("\(response.results.first?.address")
  case .Failure(let error):
    print("\(error)")
  }
}
```

### License
This framework is released under the [Apache 2.0 License](LICENSE)
