//
//  File.swift
//  
//
//  Created by Benjamin Pisano on 12/06/2022.
//

import Foundation
import Combine

@available(iOS 13.0, *)
@available(tvOS 13.0, *)
@available(watchOS 6.0, *)
@available(macOS 10.15, *)
public extension Publisher where Output: ToPublicModelConvertible {
    func toPublicModel() -> AnyPublisher<Output.PublicModel, Failure> {
        compactMap(\.publicModel)
            .eraseToAnyPublisher()
    }
}

@available(iOS 13.0, *)
@available(tvOS 13.0, *)
@available(watchOS 6.0, *)
@available(macOS 10.15, *)
public extension Publisher where Output: ToAppModelConvertible {
    func toAppModel() -> AnyPublisher<Output.AppModel, Failure> {
        compactMap(\.appModel)
            .eraseToAnyPublisher()
    }
}
