// Copyright (C) Moush group 2023
import SwiftUI
import GoogleSignIn

import GoogleSignInSwift
import GoogleAPIClientForRESTCore
import GTMSessionFetcherCore
// client ID
// 133653199403-mr3mut1uopve5h28vdh3iutn0i3absit.apps.googleusercontent.com

//com.googleusercontent.apps.133653199403-mr3mut1uopve5h28vdh3iutn0i3absit



struct ContentView: View
{
    @State var driveID: String?
    
    var body: some View
    {
        VStack {
//            GoogleSignInButton(action: handleSignInButton)
            Button("Sign In")
            {
                // when sign in is pressed, sign in to google
                handleSignInButton ()
            }
            
            Button("Upload")
            {
                if(driveID == nil){
                    if let url = URL(string: "https://www.googleapis.com/drive/v3/drives/\(driveID)") {
                        UIApplication.shared.open(url)
                    }
                }
            }
        }
        .onAppear {
            // when the browser pops up, retore previous sign in
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                
            }
        }
    }
    
    // TODO: find out why this is not working
//    func grabFileFromGDrive()
//    {
//        let query = GTLRDriveQuery_FilesList.query()
//            query.pageSize = 10 // You can adjust the page size as needed
//            service.executeQuery(query) { (ticket, fileList, error) in
//                if let error = error {
//                    print("Error fetching files: \(error.localizedDescription)")
//                    return
//                }
//
//                if let fileList = fileList as? GTLRDrive_FileList, let files = fileList.files {
//                    for file in files {
//                        print("File Name: \(file.name)")
//                    }
//                }
//            }
//    }
    
    // this opens a new window that brings us to the google login window. Then it saves your ID
    // for future use.
    func handleSignInButton() {
        GIDSignIn.sharedInstance.signIn(withPresenting: (UIApplication.shared.windows.first?.rootViewController)!) { signInResult, error in
                
                guard let result = signInResult else {
                    // Inspect error
                    
                    return
                }
                
                dump(result)
                
                driveID = result.user.idToken?.tokenString
                dump (driveID)
            
                // If sign in succeeded, display the app's main content View.
                let newRootView = UIHostingController(rootView: ContentView())
                UIApplication.shared.windows.first?.rootViewController = newRootView
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
