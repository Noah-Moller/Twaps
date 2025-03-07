import SwiftUI
import AppKit

/**
 * HelloWorldTwap
 *
 * A simple example Twap that displays a greeting and a button.
 * This demonstrates the basic structure of a Twap.
 */
@_cdecl("createDynamicView")
public func createDynamicView() -> UnsafeMutableRawPointer {
    let view = AnyView(
        VStack(spacing: 20) {
            Text("Hello from Twaps!")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            Text("This is a simple example Twap")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Button("Click Me") {
                print("Button clicked!")
                
                // Create an alert
                let alert = NSAlert()
                alert.messageText = "Hello World!"
                alert.informativeText = "This is a Twap running in the TwapsClient app."
                alert.alertStyle = .informational
                alert.addButton(withTitle: "OK")
                alert.runModal()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Twaps Framework Demo")
                .font(.caption)
                .padding(.top, 20)
        }
        .padding(30)
        .frame(width: 400, height: 300)
    )
    
    let hostingController = NSHostingController(rootView: view)
    return Unmanaged.passRetained(hostingController).toOpaque()
}

// Dummy global to force the export of createDynamicView
public let __forceExport_createDynamicView: Void = {
    _ = createDynamicView
}() 