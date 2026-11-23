// swift-tools-version: 6.1
// PDFjet for Swift, copied from the release of the same tag of
// https://github.com/edragoev1/pdfjet by its .packaging/package-swift.sh.
// Its examples, its tests and the issues are there.
import PackageDescription

let package = Package(
    name: "PDFjet",
    products: [
        // PDFjet, with the fonts PDFjet carries for every European language,
        // in Latin, Greek and Cyrillic, about 7 MB, in the bundle of the
        // target PDFjetFonts.
        .library(name: "PDFjet", targets: ["PDFjet"]),
        // The fonts of every other script, IBM Plex Sans JP, KR, SC and TC,
        // IBM Plex Sans Arabic, Hebrew and Thai, and Noto Sans of the scripts
        // TextBlock shapes, Regular and Bold, about 54 MB, for an app
        // that draws in them:
        // .product(name: "PDFjetFontsWorld", package: "pdfjet-swift").
        .library(name: "PDFjetFontsWorld", targets: ["PDFjetFontsWorld"]),
        // The European fonts, which the product PDFjet has: kept so that an
        // app that listed it still builds; it adds nothing to PDFjet.
        .library(name: "PDFjetFonts", targets: ["PDFjetFonts"]),
    ],
    targets: [
        .target(
            name: "PDFjetFonts",
            path: "resources/fonts",
            exclude: [
                "world",
                "IBMPlexSerif/license.txt",
            ],
            sources: ["PDFjetFonts.swift"],
            resources: [
                .process("CascadiaMono"),
                .process("IBMPlexSans"),
                .process("IBMPlexSerif"),
            ]
        ),
        .target(
            name: "PDFjetFontsWorld",
            path: "resources/fonts/world",
            exclude: [
                "IBMPlexSansKR/license.txt",
                "IBMPlexSansSC/license.txt",
                "IBMPlexSansTC/license.txt",
                "IBMPlexSansArabic/license.txt",
                "IBMPlexSansHebrew/license.txt",
                "IBMPlexSansThai/license.txt",
                "ICUDictionaries/license.txt",
                "NotoSansBengali/license.txt",
                "NotoSansDevanagari/license.txt",
                "NotoSansGujarati/license.txt",
                "NotoSansGurmukhi/license.txt",
                "NotoSansKannada/license.txt",
                "NotoSansKhmer/license.txt",
                "NotoSansLao/license.txt",
                "NotoSansMalayalam/license.txt",
                "NotoSansMyanmar/license.txt",
                "NotoSansOriya/license.txt",
                "NotoSansSinhala/license.txt",
                "NotoSansTamil/license.txt",
                "NotoSansTelugu/license.txt",
            ],
            sources: ["PDFjetFontsWorld.swift"],
            resources: [
                .process("IBMPlexSansJP"),
                .process("IBMPlexSansKR"),
                .process("IBMPlexSansSC"),
                .process("IBMPlexSansTC"),
                .process("IBMPlexSansArabic"),
                .process("IBMPlexSansHebrew"),
                .process("IBMPlexSansThai"),
                .process("ICUDictionaries"),
                .process("NotoSansBengali"),
                .process("NotoSansDevanagari"),
                .process("NotoSansGujarati"),
                .process("NotoSansGurmukhi"),
                .process("NotoSansKannada"),
                .process("NotoSansKhmer"),
                .process("NotoSansLao"),
                .process("NotoSansMalayalam"),
                .process("NotoSansMyanmar"),
                .process("NotoSansOriya"),
                .process("NotoSansSinhala"),
                .process("NotoSansTamil"),
                .process("NotoSansTelugu"),
            ]
        ),
        .target(name: "PDFjet", dependencies: ["PDFjetFonts"]),
    ]
)
