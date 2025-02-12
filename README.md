# Flutter Savings App

## Overview
This Flutter application allows users to manage their annual savings by automatically splitting them into two components: **CompA** and **CompB**. Users can withdraw amounts from either component and view their savings history.

## Features
- **Enter Annual Savings**: Users can input their savings, which are automatically split into CompA and CompB.
- **Withdraw Savings**: Users can withdraw from either CompA or CompB.
- **View Balance**: The main screen displays the remaining balances of CompA and CompB.
- **History Tracking**: Users can view the historical records of savings and withdrawals.
- **Data Persistence**: All data is stored locally to maintain records even after the app restarts.
- **Animations & Charts**: Savings history is visually represented using charts for better insights.

## Tech Stack
- **Flutter** (Latest Version)
- **Dart**
- **State Management**: Riverpod (Chosen for its simplicity, scalability, and better performance compared to Provider)
- **Local Storage**: Hive (Chosen for its speed, lightweight nature, and seamless Dart integration)
- **Navigation**: GoRouter
- **UI Framework**: Material Design
- **Charts & Animations**: fl_chart

## Project Structure
```
lib/
├── main.dart              # Entry point of the app
├── models/
│   ├── savings_model.dart # Model class for savings data
├── providers/
│   ├── savings_provider.dart # State management using Riverpod
├── core/
│   ├── hive_service.dart # Hive service
├── views/
│   ├── home_screen.dart       # Main screen with balances and navigation
│   ├── savings_entry_screen.dart # Screen for entering savings
│   ├── withdrawal_screen.dart     # Screen for withdrawing savings
│   ├── history_screen.dart        # Screen to view savings history
├── widgets/
│   ├── savings_chart.dart     # Chart widget for visualizing savings history
```

## Installation & Setup
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/utsavhingar22/savings_app.git
   cd flutter_savings_app
   ```
2. **Install Dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the App:**
   ```sh
   flutter run
   ```

## Justification for State Management (Riverpod)
Riverpod was chosen over other state management solutions due to:
- **Performance**: It avoids unnecessary widget rebuilds.
- **Scalability**: Works well with large-scale applications.
- **Ease of Use**: Eliminates the need for context-based dependency injection.

## Justification for Data Persistence (Hive)
Hive was selected because:
- **High Performance**: Faster than SQLite for small to medium datasets.
- **Easy to Use**: Minimal boilerplate code required.
- **Native Dart Support**: No additional dependencies needed.

## Additional Notes
- **Animations**: The history screen includes animations for smooth UI interactions.
- **Charts**: fl_chart is used to visualize savings and withdrawals.
- **Responsive UI**: The app is optimized for different screen sizes.

## Submission Guidelines
- Ensure the app runs without errors before submission.
- Submit the source code via GitHub or a ZIP file.
- Include this `README.md` in the submission.

## Author
Utsav Hingar

---
*Happy Coding! 🚀*

