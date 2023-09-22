# ModelConversion

A Swift package used for model conversion inside an app.

# Table of contents

1. [Installation](#installation)
2. [Documentation](#documentation)

# Installation

In your `Package.swift` Swift Package Manager manifest, add the following dependency to your dependencies argument:

```swift
.package(url: "https://github.com/bpisano/model-conversion.git"),
```

Add the dependency to any targets you've declared in your manifest:

```swift
.target(name: "MyTarget", dependencies: ["ModelConversion"]),
```

# Documentation

Managing various services within an application can be challenging due to the diversity of service models involved. To streamline this process, consider creating distinct models for each service. This package is designed to assist you in this endeavor. For instance, in an application that interacts with an API to fetch user data, it's advisable to create separate models such as `PublicUser` and `AppUser`, each tailored to the specific requirements of their respective services.

```swift
struct PublicUser: Decodable {
    let id: String
    let user_name: String
}
```

```swift
struct User {
    let id: UUID
    let username: String
}
```

To convert models to each others, simply conforms these models to `ToPublicModelConvertible` and `ToAppModelConvertible`.

```swift
extension PublicUser: ToAppModelConvertible {
    var appModel: User {
        User(id: UUID(string: id), username: user_name)
    }
}
```

```swift
extension User: ToPublicModelConvertible {
    var publicModel: PublicUser {
        PublicUser(id: id.uuidString, user_name: username)
    }
}
```

Additionally, this package offers extensions for `Arrays` and `Publishers` that encompass elements conforming to `ToAppModelConvertible` and `ToPublicModelConvertible`, both for input and output transformations.
