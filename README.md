# ModelConversion

A Swift package used for model conversion inside an app.

## Installation

Add the following dependency to your Package.swift file:

```swift
.package(url: "https://github.com/bpisano/model-conversion.git"),
```

## Usage

Let's say you have a `UserDto` and a `User` model:

```swift
struct UserDto: Decodable {
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

To convert models to each others, simply conforms these models to `ToDtoConvertible` and `ToAppModelConvertible`.

```swift
import ModelConversion

extension UserDto: ToAppModelConvertible {
    var appModel: User {
        User(id: UUID(string: id), username: user_name)
    }
}
```

```swift
import ModelConversion

extension User: ToDtoConvertible {
    var dto: UserDto {
        UserDto(id: id.uuidString, user_name: username)
    }
}
```

Additionally, this package offers extensions for `Arrays` and `Publishers` that encompass elements conforming to `ToAppModelConvertible` and `ToDtoConvertible`, both for input and output transformations.

```swift
let userDtos: [UserDto] = [...]
usersDto.appModels // An array of User
```

```swift
let userDto: UserDto = // your user dto
Just(user)
    .toAppModel()
    .sink { user in
        // Handle the converted user
    }
```
