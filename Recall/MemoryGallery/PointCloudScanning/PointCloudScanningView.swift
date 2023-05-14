//
//  PointCloudScanningView.swift
//  Test1231231231
//
//  Created by jeffreyzfq on 2021/9/22.
//

import SwiftUI
import MetalKit
import ARKit
import UIKit
import Metal


struct PointCloudScanningView: UIViewRepresentable {
    @Binding var willSave: Bool
    @Binding var isNOTSaved: Bool
    var fileName: String
    
    private let session = ARSession()
    private var renderer: Renderer!
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, willSave: $willSave, isNOTSaved: $isNOTSaved)
    }

    init(willSave: Binding<Bool>, isNOTSaved: Binding<Bool>, named name: String) {
        let configuration = ARWorldTrackingConfiguration()
        configuration.frameSemantics = .sceneDepth

        // Run the view's session
        session.run(configuration)

        // The screen shouldn't dim during AR experiences.
        UIApplication.shared.isIdleTimerDisabled = true

        renderer = Renderer(session: ARSession(), metalDevice: MTLCreateSystemDefaultDevice() as! MTLDevice, renderDestination: MTKView())
        
        self._willSave = willSave
        self._isNOTSaved = isNOTSaved
        fileName = name
    }

    
    func makeUIView(context: Context) -> MTKView {
        let view = MTKView()
        
        guard let device = MTLCreateSystemDefaultDevice() else {
            print("failed to create qualified device")
            return view
        }

        session.delegate = context.coordinator
        
        view.device = device
        view.backgroundColor = UIColor.clear
        // we need this to enable depth test
        view.depthStencilPixelFormat = .depth32Float
        view.contentScaleFactor = 1
        view.delegate = context.coordinator

        // Configure the renderer to draw to the view
        //self.setRenderer(session: session, device: device, renderDestination: view)
        renderer.rebuild(session: session, metalDevice: device, renderDestination: view)
        renderer.drawRectResized(size: view.bounds.size)


//        // Setup a save button
//        let button = UIButton(type: .system, primaryAction: UIAction(title: "Save", handler: { (action) in
//            self.renderer.savePointsToFile()
//        }))
//        button.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(button)
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])

        return view
    }

    func updateUIView(_ uiView: MTKView, context: Context) { }


    class Coordinator: NSObject, MTKViewDelegate, ARSessionDelegate {
        var parent: PointCloudScanningView
        var renderer: Renderer
        var fileName: String
        @Binding var willSave: Bool
        @Binding var isNOTSaved: Bool
        
        init(_ pointCloudScanningView: PointCloudScanningView, willSave: Binding<Bool>, isNOTSaved: Binding<Bool>) {
            self.parent = pointCloudScanningView
            self.renderer = parent.renderer
            self._willSave = willSave
            self._isNOTSaved = isNOTSaved
            self.fileName = parent.fileName
        }
        
        func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
            renderer.drawRectResized(size: size)
        }

        func draw(in view: MTKView) {
            renderer.draw()
            
            if willSave {
                renderer.savePointsToFile(name: fileName)
                isNOTSaved = false
                willSave = false
            }
            
        }
    }


}

// MARK: - RenderDestinationProvider

protocol RenderDestinationProvider {
    var currentRenderPassDescriptor: MTLRenderPassDescriptor? { get }
    var currentDrawable: CAMetalDrawable? { get }
    var colorPixelFormat: MTLPixelFormat { get set }
    var depthStencilPixelFormat: MTLPixelFormat { get set }
    var sampleCount: Int { get set }
}

extension MTKView: RenderDestinationProvider {

}
