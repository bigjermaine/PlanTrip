# Network and Core Data Management

## Overview

This repository provides a `NetworkManager` class for handling asynchronous CRUD operations for city and option data, as well as a `CoreDataManager` class for managing Core Data storage of trip entities in an iOS application. This setup allows you to fetch data from a remote API and store it locally using Core Data.

## Classes

### `NetworkManager`

The `NetworkManager` is a singleton responsible for fetching data from a remote API.

#### Methods

## Endpoints

### 1. Fetch Cities

- **Method**: GET
- **URL**: `https://jermaine.free.beeceptor.com/cities`
- **Response**: An array of `Citys` objects.

Usage

To fetch cities, call the `fetchCities()` method:

swift
do {
    let cities = try await NetworkManager.shared.fetchCities()
    // Process the cities array
} catch {
    print("Error fetching cities: \(error)")
}


2. Fetch Dropdown Options

- **Method**: GET
- **URL**: `https://jermaine.free.beeceptor.com/values`
- **Response**: An array of `DropdownMenuOption` objects.

Description

The `fetchOptions()` method retrieves a list of options for a dropdown menu. This can be useful for populating selection menus in your application.

 Request Example

You can call the `fetchOptions()` method like this:

swift
do {
    let options = try await NetworkManager.shared.fetchOptions()
    // Use the options array as needed
    print(options)
} catch {
    print("Error fetching dropdown options: \(error)")
}
 Errors

  - `CityError`
  - `invalidURL`: Raised when the URL is invalid.
  - `requestFailed(error)`: Raised when the network request fails.


CoreDataManager

The `CoreDataManager` is an `ObservableObject` that manages Core Data operations for the `Trip` entity.

Properties

- **`container`**: `NSPersistentContainer` for Core Data storage.
- **`savedEntity`**: A published array of `Trip` entities, which updates the UI when modified.

Initializer

- Initializes the persistent container and fetches existing trips.

Methods

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

 Usage

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


![Simulator Screenshot - iPhone x - 2024-09-23 at 04 32 23](https://github.com/user-attachments/assets/5fa3afb8-99aa-46b1-a785-213e295a98d6)
