# Network and Core Data Management

## Overview

This repository provides a `NetworkManager` class for handling asynchronous CRUD operations for city and option data, as well as a `CoreDataManager` class for managing Core Data storage of trip entities in an iOS application. This setup allows you to fetch data from a remote API and store it locally using Core Data.

## Classes

### `NetworkManager`

The `NetworkManager` is a singleton responsible for fetching data from a remote API.

#### Methods

- **`fetchCities()`**
  - Fetches a list of cities from a specified URL.
  - Returns an array of `Citys` objects.
  - Throws `CityError` on failure.
  
- **`fetchOptions()`**
  - Fetches dropdown menu options from a specified URL.
  - Returns an array of `DropdownMenuOption` objects.
  - Throws `CityError` on failure.

#### Errors

- `CityError`
  - `invalidURL`: Raised when the URL is invalid.
  - `requestFailed(error)`: Raised when the network request fails.

### `CoreDataManager`

The `CoreDataManager` is an `ObservableObject` that manages Core Data operations for the `Trip` entity.

#### Properties

- **`container`**: `NSPersistentContainer` for Core Data storage.
- **`savedEntity`**: A published array of `Trip` entities, which updates the UI when modified.

#### Initializer

- Initializes the persistent container and fetches existing trips.

#### Methods

- **`fetchTrips()`**
  - Fetches all `Trip` entities from Core Data and updates `savedEntity`.

- **`addTrip(name:style:description:city:start:end:)`**
  - Adds a new trip with the specified details.
  - Calls `saveBooking()` to persist the new entity.

- **`saveBooking()`**
  - Saves the current context to persist changes in Core Data.
  - Calls `fetchTrips()` to refresh the saved entities.

- **`delete(index:)`**
  - Deletes a trip at the specified index in `savedEntity`.
  - Calls `saveBooking()` to persist the deletion.

## Usage

### Fetching Data

To fetch cities or options, simply call:

```swift
do {
    let cities = try await NetworkManager.shared.fetchCities()
    let options = try await NetworkManager.shared.fetchOptions()
} catch {
    print("Error fetching data: \(error)")
}
```

### Managing Trips

To manage trips in Core Data:

- To add a trip:

```swift
coreDataManager.addTrip(name: "Beach Vacation", style: "Relaxing", description: "A relaxing trip to the beach", city: "Miami", start: "2023-06-01", end: "2023-06-07")
```

- To delete a trip:

```swift
let indexSet = IndexSet(integer: 0) // Replace with the actual index
coreDataManager.delete(index: indexSet)
```

## Requirements

- iOS 13.0+
- Swift 5.0+
- Core Data

## Conclusion

This setup provides a streamlined way to manage remote data fetching and local data storage, making it easier to build data-driven 

![Uploading Simulator Screenshot - iPhone x - 2024-09-23 at 04.32.23.png…]()
