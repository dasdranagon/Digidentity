//
//  ListPresenter.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class ListPresenter {
    enum Constants {
        static let maxPageCount = 10
    }
    
    weak var view: ListRepresentation!
    weak var wireframe: ListWireframe!
    weak var interactor: ListInteractor!

    private var processing: Bool = false
    private var lastPageCount = Constants.maxPageCount
}

extension ListPresenter {
    private func processing(at indicatorLocation: ProcessingIndicatorLocation, show: Bool) {
        processing = show
        self.view.processing(at: indicatorLocation, show: show)
    }
}

extension ListPresenter: ListIntentObserver {

    func ready() {
        processing(at: .top, show: true)
        interactor.setup()
    }
    
    func passedFirst() {
        guard !processing else {
            processing(at: .top, show: false)
            return
        }
        
        processing(at: .top, show: true)
        interactor.fetchNewest()
    }
    
    func passedLast() {
        guard !processing,
              lastPageCount == Constants.maxPageCount else {
            processing(at: .bottom, show: false)
            return
        }
        
        processing(at: .bottom, show: true)
        interactor.fetchNextPage()
    }
    
    func addNewImage() {
        wireframe.addNewImage()
    }
}

extension ListPresenter: ListInteractorOutput {
    func fail() {
        self.view.processing(at: .top, show: false)
        self.view.processing(at: .bottom, show: false)
    }
    
    
    func update(items: [ListItem]) {
        lastPageCount = items.count
        let newItems = items.compactMap { convertToDisplayItem(item: $0) }
        
        self.processing(at: .top, show: false)
        self.view.update(items: newItems)
    }
    
    func append(items: [ListItem]) {
        lastPageCount = items.count
        let newItems = items.compactMap { convertToDisplayItem(item: $0) }
        
        self.processing(at: .bottom, show: false)
        self.view.append(items: newItems)
    }
    
    private func convertToDisplayItem(item: ListItem) -> ListDisplayItem? {
        guard let image = item.image.uiImage else {
            return nil
        }
        
        return ListDisplayItem(id:item.id, image: image, text: item.text, confidence: "Confidence: \(item.confidence)")
    }
}
