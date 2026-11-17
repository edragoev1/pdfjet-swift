# PDFjet for Swift

The Swift package of [PDFjet](https://github.com/edragoev1/pdfjet), a library
that makes PDF documents: text in the fonts it carries, tables that run across
pages, charts, barcodes and QR codes, SVG and images, accessible PDF/UA and
archival PDF/A. It runs on macOS, iOS, visionOS and Linux.

This repository holds the Swift library alone, about 60 MB, copied from each
release of [edragoev1/pdfjet](https://github.com/edragoev1/pdfjet) and tagged
with the same version, so that SwiftPM does not clone the whole history of
PDFjet's four ports. The examples, the tests, the documentation and the issues
are there.

## Installing

In Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/edragoev1/pdfjet-swift", from: "9.1.9"),
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
import PDFjet

let pdf = try PDF(OutputStream(toFileAtPath: "hello.pdf", append: false)!)
let font = try Font(pdf, IBMPlexSans.Regular)
font.setSize(14.0)
let page = try Page(pdf, Letter.PORTRAIT)
let line = TextLine(font, "Hello, PDF!")
line.setLocation(50.0, 80.0)
try line.drawOn(page)
try pdf.complete()
```

`llms-swift.txt` is the guide to PDFjet for AI coding assistants.

## License

MIT: see LICENSE. The fonts are under the SIL Open Font License, each with its
license in its folder.
