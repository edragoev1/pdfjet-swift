# PDFjet for Swift

The Swift package of [PDFjet](https://github.com/edragoev1/pdfjet), a library
that makes PDF documents: text in the fonts it carries, tables that run across
pages, charts, barcodes and QR codes, SVG and images, accessible PDF/UA and
archival PDF/A. It runs on macOS, iOS, visionOS and Linux.

## Why this repository exists

PDFjet is developed in [edragoev1/pdfjet](https://github.com/edragoev1/pdfjet),
one repository for its four ports: Java, C#, Go and Swift. That repository
also keeps the examples with the PDFs they make, the test data and the fonts
of every release, and its history is about 1 GB.

SwiftPM always clones the whole history of a package's repository, not just
the files of one version. An app that depended on edragoev1/pdfjet downloaded
that 1 GB, and kept it in its build folder, to use 3 MB of Swift code and the
fonts.

This repository holds the Swift package alone: Package.swift, the library's
sources, the fonts it carries, its license and the guide for AI coding
assistants. A first download is about 50 MB, mostly fonts, and a new release
adds only what changed in it.

Nothing is developed here. Each release of PDFjet is copied in from its tag
by `.packaging/package-swift.sh` of edragoev1/pdfjet, and tagged with the same
version, v9.1.9 and on: the code is the same, byte for byte, and so are the
PDFs it makes. Please open issues and pull requests in
[edragoev1/pdfjet](https://github.com/edragoev1/pdfjet), where the examples,
the tests and the documentation are.

The package `https://github.com/edragoev1/pdfjet` keeps working for apps
that use it; this one is the same library with a much smaller download.

## Installing

In Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/edragoev1/pdfjet-swift", from: "9.2.1"),
],
targets: [
    .target(name: "MyApp", dependencies: [
        .product(name: "PDFjet", package: "pdfjet-swift"),
    ]),
]
```

The product `PDFjet` has the fonts for every European language: IBM Plex Sans
and Serif and Cascadia Mono, in Latin, Greek and Cyrillic. For Chinese,
Japanese, Korean, Arabic, Hebrew and Thai, add the product `PDFjetFontsWorld`
as well:

```swift
.product(name: "PDFjetFontsWorld", package: "pdfjet-swift"),
```

In Xcode: File > Add Package Dependencies, and the address
`https://github.com/edragoev1/pdfjet-swift`.

## A first PDF

```swift
import Foundation
import PDFjet

let pdf = PDF(OutputStream(toFileAtPath: "hello.pdf", append: false)!)
let font = try Font(pdf, IBMPlexSans.Regular)
font.setSize(14.0)
let page = Page(pdf, Letter.PORTRAIT)
let line = TextLine(font, "Hello, PDF!")
line.setLocation(50.0, 80.0)
line.drawOn(page)
try pdf.complete()
```

`llms-swift.txt` is the guide to PDFjet for AI coding assistants.

## License

MIT: see LICENSE. The fonts are under the SIL Open Font License, each with its
license in its folder.
