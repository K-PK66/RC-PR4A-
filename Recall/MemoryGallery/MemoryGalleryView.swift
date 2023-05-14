import SwiftUI
import SceneKit
import ARKit

class MemoryGalleryViewModel: ObservableObject {
    @Published var sceneModels: [String : URL]
    let manager = LocalFileManager.instance
    
    init() {
        sceneModels = manager.getAllSceneObjects()
    }
    
    func update() {
        sceneModels = manager.getAllSceneObjects()
    }
    
    func createNewSceneModel() { }
    
    func deleteSceneModel(url: URL) { }
    
    func changeFileName(of name: String, newName: String) {
        let unique = newName.uniqued(withRespectTo: sceneModels.keys.sorted())
        manager.changeFileName(of: sceneModels[name]!, newName: unique)
        update()
    }
}

struct MemoryGallery: View {
    @EnvironmentObject var viewModel: MemoryGalleryViewModel
    @ObservedObject var searchBar: SearchBar = SearchBar()
    @State var showScanningView: Bool = false
    @State var willSave: Bool = false
    @ObservedObject var objectCaptureModel: CameraViewModel
    
    enum SceneStatus {
        case folderPage
        case liDARScanning
        case objectCapture
    }
    
    @State var sceneStatus: SceneStatus = .folderPage
    
    var body: some View {
        
        if sceneStatus == .folderPage {
            // MARK: - memory gallery folder page
            Group {
                if viewModel.sceneModels.first != nil {
                    Grid
                } else {
                    Text("Empty album, tap '+' to create a new scene, or you can import models in Folder")
                        .font(Font.title2)
                }
            }
            .navigationBarItems(
                leading: Menu {
                    Button(action: {
                        sceneStatus = .objectCapture
                    }, label: {
                        Text("使用ObjectCapture创建模型")
                    })
                    Button(action: {
                        showScanningView = true
                        sceneStatus = .liDARScanning
                        viewModel.createNewSceneModel()
                    }, label: {
                        Text("使用LiDAR扫描场景")
                    })
                } label: {
                    Image(systemName: "plus").imageScale(.large)
                },
                trailing: EmptyView()
            )
            .onAppear {
                viewModel.update()
            }
        } else if sceneStatus == .liDARScanning {
            // MARK: - 3d object scanning
            Group {
                if !ARWorldTrackingConfiguration.supportsFrameSemantics(.sceneDepth) {
                    Text("Sorry, your device does not support this 3d scene scanning program.")
                } else {
                    PointCloudScanningView(willSave: $willSave, isNOTSaved: $showScanningView, named: newFilename)
                        
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    sceneStatus = .folderPage
                    showScanningView = false
                }, label: {
                    Text("Cancel")
                }),
                trailing: Button(action: {
                    willSave = true
                    //viewModel.update()
                    //sceneStatus = .folderPage
                }, label: {
                    Text("save")
                })
            )
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Group {
                ZStack {
                    // Make the entire background black.
                    Color.black.edgesIgnoringSafeArea(.bottom)
                    CameraView(model: objectCaptureModel)
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    sceneStatus = .folderPage
                }, label: {
                    Text("返回")
                })
            )
            // Force dark mode so the photos pop.
            //.environment(\.colorScheme, .dark)
        }
        
    }
    
    var newFilename: String {
        let name = "untitled".uniqued(withRespectTo: viewModel.sceneModels.keys.sorted())
        print(name)
        print(viewModel.sceneModels.keys.sorted())
        return name
    }
    
    var Grid: some View {
        return ScrollGrid(viewModel.sceneModels.keys.sorted(), id: \.self, itemsPerRow: 4) { sceneObjectName in
            SceneBlock(name: sceneObjectName, url: viewModel.sceneModels[sceneObjectName]!)
                .environmentObject(viewModel)
        }.padding(.horizontal)
    }
    
}
    
    
// MARK: - SceneBlockView
struct SceneBlock: View {
    @EnvironmentObject var viewModel: MemoryGalleryViewModel
    
    var name: String
    var url: URL
    
    let manager = LocalFileManager.instance
    
    @State var showAlert: Bool = false
    @State var newName: String = ""
    
    var body: some View {
        // MARK: - change this after build up Memery Scene
        return VStack(alignment: .leading) {
            NavigationLink(destination:
                            SceneView(scene: manager.getObjectScene(url: url)!, options: [.allowsCameraControl, .autoenablesDefaultLighting])
                                .edgesIgnoringSafeArea(.all)
                                .navigationBarTitleDisplayMode(.inline)
                , label: {
                Image("3dModel")
                    .resizable()
                    //.frame(width: geometry.width, alignment: .center)
                    .scaledToFill()
                    .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9450980392, blue: 0.9647058824, alpha: 1)))
                    .mask(RoundedRectangle(cornerRadius: 6.0))
                    .shadow(radius: 2)
                    
            })
            .navigationViewStyle(StackNavigationViewStyle())
            
            HStack {
                Text(name)
                    .font(.title3)
                    //.foregroundColor(Color.white)
                Spacer()
                Button(action: {
                    showAlert = true
                }, label: {
                    Image(systemName: "pencil.circle")
                })
                .popover(isPresented: $showAlert, arrowEdge: .trailing) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 130)
                            .foregroundColor(Color.white)
                        VStack(alignment: .center) {
                            Text("输入新名称")
                            Spacer()
                            HStack {
                                Spacer()
                                TextField("未命名", text: $newName)
                                    .frame(width: 160)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: { showAlert = false }, label: { Text("取消") })
                                Spacer(minLength: 80)
                                Button(action: {
                                    viewModel.changeFileName(of: name, newName: newName)
                                    showAlert = false
                                    
                                    //memoryScene.setName(newName: newName, context: context)
                                }, label: {
                                    Text("完成")
                                })
                                Spacer()
                            }
                        }.padding(.vertical)
                    }
                }
            }
                
        }
    }
    
}

// MARK: - SceneEditButton
struct SceneEditButton: View {
    @Binding var editMode: Bool
    
    var body: some View {
        Button(action: {
            editMode = !editMode
            //print("editmode : \(editMode)")
        }, label: {
            Group {
                Text(editMode == false ? "编辑" : "完成")
            }
        })
    }
}


