# G Drive App

A SwiftUI application demonstrating Google Sign-In integration and basic interactions with the Google Drive API.

## Overview

This project is a Proof of Concept (PoC) for integrating Google Authentication into a SwiftUI app. It allows users to sign in with their Google credentials and retrieves authentication tokens necessary for making requests to the Google Drive API.

> **Note**: This project is currently a work in progress. Some features (like file uploading and listing) are implemented as placeholders or are currently commented out.

## Features

- **Google Sign-In**: Secure native authentication using `GoogleSignIn` and `GoogleSignInSwift`.
- **Token Management**: Retrieves and displays the user's ID token upon successful login.
- **Session Restoration**: Automatically attempts to restore the previous user session on app launch.
- **Deep Link Handling**:Properly handles URL callbacks for the OAuth flow via `AppDelegate`.

## Requirements

- **iOS** 15.0+ / **macOS** 12.0+ (depending on target)
- **Xcode** 14.0+
- **Swift** 5.0+

## Getting Started

### Prerequisites

You must have a valid Google Cloud Console project with the Drive API enabled and OAuth credentials configured.
The file `client_133653199403-mr3mut1uopve5h28vdh3iutn0i3absit.apps.googleusercontent.com.plist` corresponds to the Google Service credentials.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/GDriveAPI.git
   cd GDriveAPI
   ```

2. **Open the project**:
   Double-click `G Drive App/G Drive App.xcodeproj` to open it in Xcode.

3. **Configure Signing**:
   Ensure you select your Development Team in the project settings (Targets -> G Drive App -> Signing & Capabilities).

4. **Run the App**:
   Select a simulator or connected device and press `Cmd + R`.

## Usage

1. Launch the app.
2. Tap the **Sign In** button.
3. Complete the Google authentication flow in the browser/dialog.
4. Check the Xcode debug console to see the user object and ID token output.
5. The **Upload** button currently redirects to a placeholder URL structure.

## Code Structure

- **ContentView.swift**: Main UI, Sign-In button logic, and "Upload" placeholder.
- **G_Drive_AppApp.swift**: App entry point, `AppDelegate` for URL handling and state management.

## License

Copyright (C) Moush group 2023. All rights reserved.