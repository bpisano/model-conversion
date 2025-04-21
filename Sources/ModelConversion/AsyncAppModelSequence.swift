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
public struct AsyncAppModelSequence<Sequence: AsyncSequence>: AsyncSequence where Sequence.Element: ToAppModelConvertible {
    public struct Iterator: AsyncIteratorProtocol {
        var iterator: Sequence.AsyncIterator

        init(sequence: Sequence) {
            iterator = sequence.makeAsyncIterator()
        }

        public mutating func next() async throws -> Sequence.Element.AppModel? {
            try await iterator.next()?.appModel
        }
    }

    private let sequence: Sequence

    init(_ sequence: Sequence) {
        self.sequence = sequence
    }

    public func makeAsyncIterator() -> Iterator {
        Iterator(sequence: sequence)
    }
}

@available(iOS 18.0, *)
@available(tvOS 18.0, *)
@available(watchOS 11.0, *)
@available(macOS 15.0, *)
extension AsyncAppModelSequence: Sendable where Sequence: Sendable, Sequence.Element: Sendable { }

@available(iOS 18.0, *)
@available(tvOS 18.0, *)
@available(watchOS 11.0, *)
@available(macOS 15.0, *)
public extension AsyncSequence where Element: ToAppModelConvertible {
    var appModels: AsyncAppModelSequence<Self> {
        AsyncAppModelSequence(self)
    }
}
