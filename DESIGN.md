### DESIGN.md

```markdown
# StrongHER Design Document

## Overview

StrongHER is designed to provide users with a seamless way to manage their fitness routines. The project leverages SwiftUI for the user interface and a combination of state management patterns for data handling. 

### Core Components
1. **WorkoutViewModel**
   - Centralized state management for workouts and user data.
   - Handles CRUD operations for workouts (create, read, update, delete).

2. **Screens and Views**
   - `HomeScreen`: Navigation hub for all major features.
   - `WorkoutLoggerScreen`: Displays and manages user-logged workouts.
   - `NewWorkoutView`: Allows users to create custom workouts or select from pre-designed options.
   - `TrendsScreen`: Visualizes trends in workout performance using graphs.
   - `EditWorkoutView`: Provides functionality for editing existing workouts.
   - `WorkoutLibraryScreen`: Displays and manages the library of pre-designed workouts.

### Data Flow
- **Workout Data**:
  - Stored in `WorkoutViewModel` as a `@Published` array of `Workout` objects.
  - Changes propagate to all views that observe the `WorkoutViewModel`.

- **Pre-Designed Workouts**:
  - Hardcoded examples stored in `WorkoutLibraryScreen` and referenced in `NewWorkoutView`.

### Design Decisions
1. **State Management**:
   - Used `@State` for temporary local data like new workouts.
   - Used `@ObservedObject` for shared data like `WorkoutViewModel`.

2. **Navigation**:
   - Leveraged `NavigationLink` for smooth transitions between screens.
   - Included a toolbar button on applicable screens for adding or saving workouts.

3. **User Interface**:
   - Focused on clarity and simplicity with easy-to-navigate forms and lists.
   - Used dynamic layouts to adjust for different device sizes and orientations.

4. **Pre-Designed Workouts**:
   - Decided to hardcode a few examples to provide users with ready-to-use routines.

## Challenges and Future Work
- **State Synchronization**:
  - Ensuring all views update seamlessly when the `WorkoutViewModel` changes.
- **Progressive Overload Algorithm**:
  - Removed to simplify the app, but could be reintroduced for advanced users.
- **Future Features**:
  - Adding support for cloud storage and syncing across devices.
  - Enhancing visualizations on the Trends screen.
