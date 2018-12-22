//
//  AppDependencies.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

struct AppDependencies {
    struct Assemblies {
        let list = ListAssembly()
        let addImage = AddImageAssembly()
        let imagePicker = ImagePickerAssembly()
    }
    private let assemblies = Assemblies()
    
    private let navigator = StandardNavigator()
    private let storage = DefaultStorage()
    private let requestManager = DefaultRequestManager(networkConfiguration: NetworkConfiguration())
    
    private var appInitialWireframe: Wireframe!
    
    init() {
        setup()
    }
    
    func apply(window: UIWindow) {
        navigator.configure(window: window)

        appInitialWireframe.activate()
    }
    
    mutating func setup() {
        assembleCommonDependencies()
        configure()
        setupDependencies()
        injectDependencies()
    }
}

extension AppDependencies {
    private func prepareCommonDependencies() {
        storage.setup()
    }
    
    private func assembleCommonDependencies() {
        prepareCommonDependencies()
        
        let dependencies = CommonDependencies(navigator: navigator, storage: storage, requestManager: requestManager)
        CommonDependencies.shared = dependencies
    }
}

extension AppDependencies {
    private mutating func setupDependencies() {
         appInitialWireframe = assemblies.list.wireframe
        
        assemblies.list.addImageAssembly = assemblies.addImage
        assemblies.addImage.imagePickerAssembly = assemblies.imagePicker
    }
    
    private func injectDependencies() {
        let mirror = Mirror(reflecting: assemblies)
        for (_, value) in mirror.children {
            guard let assembly = value as? Assembly else { continue }
            assembly.injectDependencies()
        }
    }
    
    private func configure() {
        let mirror = Mirror(reflecting: assemblies)
        for (_, value) in mirror.children {
            guard let assembly = value as? Assembly else { continue }
            assembly.configure()
        }
    }
}
