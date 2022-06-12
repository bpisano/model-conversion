# ModelConversion

A Swift package used for model conversion inside an app.

# Installation

In your `Package.swift` Swift Package Manager manifest, add the following dependency to your dependencies argument:

```swift
.package(url: "https://github.com/bpisano/model-conversion.git"),
```

Add the dependency to any targets you've declared in your manifest:

```swift
.target(name: "MyTarget", dependencies: ["ModelConversion"]),
```

# Usage

As you manage differents services in an app, dealing with their different service's models can be hard. To improve this, you may want to create different models for each services. This package is here to help you with this task. Let's take the example of an app that calls an API in order to retrieve a user. You probably want to create an `ApiUser` and an `AppUser` witch corresponds to the model of their respective services.

```swift
struct ApiUser: Decodable {
    let id: String
    let user_name: String
}
```

```swift
struct AppUser {
    let id: UUID
    let username: String
}
```

To convert models to each others, simply conforms these models to `ToApiModelConvertible` and `ToAppModelConvertible`.

```swift
extension ApiUser: ToAppModelConvertible {
    var appModel: AppUser? {
        AppUser(id: UUID(string: id), username: user_name)
    }
}
```

```swift
extension AppUser: ToApiModelConvertible {
    var apiModel: ApiUser? {
        ApiUser(id: id.uuidString, user_name: username)
    }
}
```

This package also provides extension for Arrays and Publishers containing `ToAppModelConvertible` and `ToApiModelConvertible` elements and outputs.
