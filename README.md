# Matrimonial App

A SwiftUI-based iOS application for matrimonial services with Core Data persistence.

## Project Structure

```
MatrimonialApp/
├── AppBase/
│   ├── ContentView.swift           # Main content view
│   └── MatrimonialAppApp.swift    # App entry point
├── AppUtility/
│   ├── FontWithExtension.swift     # Custom font utilities
│   └── Fonts/                      # Custom font files
├── DataLayer/
│   ├── DataBase/
│   │   ├── Persistence.swift       # Core Data persistence setup
│   │   ├── Models/                 # Core Data entity models
│   │   └── MatrimonialApp.xcdatamodeld/
│   └── DataModel/
│       └── UserModel.swift         # User data models
├── DomainLayer/
│   └── Services/
│       ├── DB/
│       │   └── CoreDataManager.swift  # Core Data operations
│       └── Networking/
│           └── APIManager.swift    # API communication
└── PresentationLayer/
    ├── Bookmark/
    ├── Home/
    ├── Search/
    └── UIComponent/
```

## Core Features

### Data Models

#### UserData Model
- Comprehensive user profile information
- Personal details (name, gender, contact)
- Location information
- Authentication details
- Profile pictures
- Match status tracking

### Core Data Implementation

#### Storage Strategy
The app uses Core Data for persistent storage with two approaches:

1. **Simple Storage (Current Implementation)**
   - `UserItem` entity with basic attributes
   - JSON encoding for full user data
   - Efficient for simple queries and updates

2. **Relational Storage (Alternative Implementation)**
   - Multiple entities with relationships
   - Structured data model matching the domain model
   - Better for complex queries and partial updates

#### Core Data Entities

Current Implementation (`UserItem`):
- `uuid`: String
- `matchStatus`: String
- `timestamp`: Date
- `userData`: Binary Data (JSON encoded)

#### CoreDataManager Features

```swift
class CoreDataManager {
    static let shared = CoreDataManager()
    
    // CRUD Operations
    func saveUser(_ userData: UserData)
    func fetchUsers(matchStatus: MatchStatus?) throws -> [UserItem]
    func updateUser(_ userData: UserData) throws
    func deleteUser(uuid: String) throws
}
```

### Key Features

1. **Data Persistence**
   - Reliable local storage using Core Data
   - Efficient data encoding and decoding
   - Error handling and data validation

2. **Match Management**
   - Track match status (Pending, Accepted, Declined)
   - Filter users by match status
   - Update match status with persistence

3. **User Profile Management**
   - Create and update user profiles
   - Store comprehensive user information
   - Handle profile pictures and media

### Error Handling

The implementation includes comprehensive error handling for all database operations:
- Save operations with validation
- Fetch operations with optional filtering
- Update operations with existence checks
- Delete operations with proper cleanup

## Architecture

The project follows a clean architecture pattern:

1. **Presentation Layer**
   - SwiftUI views and view models
   - User interface components
   - Navigation and routing

2. **Domain Layer**
   - Business logic and services
   - Data management and operations

3. **Data Layer**
   - Core Data persistence
   - API integration
   - Data models and entities

## Font Integration

The app includes the Source Sans 3 font family with various weights:
- Regular
- Light/Bold
- Italic variants
- Custom font extension for easy usage

## Development

### Requirements
- iOS 14.0+
- Xcode 12.0+
- Swift 5.0+

### Setup
1. Clone the repository
2. Open `MatrimonialApp.xcodeproj`
3. Build and run the project

## License

This project is proprietary and confidential.
