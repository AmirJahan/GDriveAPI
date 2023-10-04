import SwiftUI
import GoogleSignIn

import GoogleSignInSwift
// client ID
// 133653199403-mr3mut1uopve5h28vdh3iutn0i3absit.apps.googleusercontent.com

//com.googleusercontent.apps.133653199403-mr3mut1uopve5h28vdh3iutn0i3absit



struct ContentView: View
{
    var body: some View
    {
        VStack {
//            GoogleSignInButton(action: handleSignInButton)
            Button("Sign In")
            {
                handleSignInButton ()
            }
            
            Button("Upload")
            {
                if let url = URL(string: "googledrive://") {
                    UIApplication.shared.open(url)
                }
            }
        }
        .onAppear {
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                // Check if `user` exists; otherwise, do something with `error`
                
//                dump (error)
                
            }
        }
    }


    
    func handleSignInButton() {
        GIDSignIn.sharedInstance.signIn(withPresenting: (UIApplication.shared.windows.first?.rootViewController)!) { signInResult, error in
                guard let result = signInResult else {
                    // Inspect error
                    
                    return
                }
                
            dump(result)

                // If sign in succeeded, display the app's main content View.
                let newRootView = UIHostingController(rootView: ContentView())
                UIApplication.shared.windows.first?.rootViewController = newRootView
            }
        }

    func handleUploadButton()
    {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
