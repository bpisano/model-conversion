//
//  File.swift
//  ModelConversion
//
//  Created by Benjamin Pisano on 05/01/2025.
//

import Foundation

@available(iOS 18.0, *)
@available(tvOS 18.0, *)
@available(watchOS 11.0, *)
@available(macOS 15.0, *)
public extension AsyncSequence where Element: ToDtoConvertible {
    var dtos: AsyncMapSequence<Self, Element.DtoModel> {
        map { $0.dto }
    }
}

@available(iOS 18.0, *)
@available(tvOS 18.0, *)
@available(watchOS 11.0, *)
@available(macOS 15.0, *)
public extension AsyncSequence where Element: ToAppModelConvertible {
    var appModels: AsyncMapSequence<Self, Element.AppModel> {
        map { $0.appModel }
    }
}
