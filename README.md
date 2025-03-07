# Twaps: The Web for Native macOS Apps

Twaps is an experimental framework that brings web-like dynamics to native macOS applications. The name "Twaps" stands for "The Web for Apps" - a vision of enabling dynamic, modular UI components in native Swift applications.

## 🧪 Experimental Project

**Note:** This is an experimental project created to explore the concept of dynamic native UI modules. It is not intended for production use at this stage. The code is shared to inspire discussion and collaboration around the idea of bringing web-like dynamics to native app development.

## 🌟 Vision

The web revolutionized content distribution by allowing dynamic loading of content without requiring application updates. Twaps aims to bring similar capabilities to native macOS applications:

- **Dynamic UI Components**: Load SwiftUI views at runtime without app recompilation
- **Modular Architecture**: Create self-contained UI modules that can be distributed independently
- **Native Performance**: Enjoy the performance and integration benefits of native code
- **Simple Distribution**: Push updates to a server and have clients automatically receive them

## 🏗️ Architecture

The Twaps ecosystem consists of three main components:

### 1. [TwapsCLI](https://github.com/Noah-Moller/TwapsCLI)

A command-line tool for building and publishing Twaps. This component:
- Compiles Swift source files into dynamic libraries
- Provides a DSL for creating Twaps (experimental)
- Pushes Twaps to a TwapsServer for distribution

### 2. [TwapsServer](https://github.com/Noah-Moller/TwapsServer)

A simple server for hosting and distributing Twaps. This component:
- Hosts Twaps (dynamic native UI modules)
- Serves Twaps to client applications
- Manages Twap metadata and versioning

### 3. [TwapsClient](https://github.com/Noah-Moller/TwapsClient)

A macOS app for loading and displaying Twaps. This component:
- Loads Twaps from a TwapsServer
- Compiles Twaps into dynamic libraries
- Displays Twaps in a native macOS interface

## 🚀 Getting Started

### Prerequisites

- macOS 13.0+ (Ventura or later)
- Swift 6.0+
- Xcode 15.0+

### Installation

1. Clone all three repositories:
   ```bash
   git clone https://github.com/Noah-Moller/TwapsCLI.git
   git clone https://github.com/Noah-Moller/TwapsServer.git
   git clone https://github.com/Noah-Moller/TwapsClient.git
   ```

2. Build the TwapsCLI:
   ```bash
   cd TwapsCLI
   swift build
   ```

3. Build and run the TwapsServer:
   ```bash
   cd TwapsServer
   swift run
   ```

4. Open and run the TwapsClient in Xcode:
   ```bash
   cd TwapsClient
   open TwapsClient.xcodeproj
   ```

### Creating and Using a Twap

1. Create a simple Twap (e.g., `MyFirstTwap.swift`):
   ```swift
   import SwiftUI
   import AppKit

   @_cdecl("createDynamicView")
   public func createDynamicView() -> UnsafeMutableRawPointer {
       let view = AnyView(
           VStack {
               Text("Hello from my first Twap!")
                   .font(.largeTitle)
                   .foregroundColor(.blue)
               
               Button("Click Me") {
                   print("Button clicked!")
                   let alert = NSAlert()
                   alert.messageText = "Hello!"
                   alert.informativeText = "This is my first Twap!"
                   alert.runModal()
               }
               .padding()
               .background(Color.blue)
               .foregroundColor(.white)
               .cornerRadius(10)
           }
           .padding()
           .frame(width: 400, height: 300)
       )
       
       let hostingController = NSHostingController(rootView: view)
       return Unmanaged.passRetained(hostingController).toOpaque()
   }

   // Dummy global to force the export of createDynamicView
   public let __forceExport_createDynamicView: Void = {
       _ = createDynamicView
   }()
   ```

2. Push the Twap to the server:
   ```bash
   cd TwapsCLI
   swift run TwapsCLI push /path/to/MyFirstTwap.swift --url myfirst.twap --yes
   ```

3. Open the TwapsClient app and enter `myfirst.twap` in the text field, then click "Go".

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤔 Limitations

- This is a proof of concept and has many limitations
- Dynamic code loading has security implications that should be carefully considered
- The approach relies on Swift ABI stability and may not work across all Swift versions
- Error handling and edge cases are not fully implemented

## 🔮 Future Possibilities

- Support for iOS and other Apple platforms
- Enhanced security model with code signing
- Dependency management for Twaps
- A marketplace for discovering and sharing Twaps
