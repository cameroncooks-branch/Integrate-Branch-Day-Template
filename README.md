# Integrate Branch Day Template
Basic iOS app template for Integrate Branch Day.

## How to prepare for Integrate Branch Day
1. Install Xcode via Self Service.
2. Download this repo.
3. Open `BuildAnAppDayTemplate.xcodeproj`.
4. Sign into your Apple ID in Xcode and edit the project's signing.
5. Run the app on the simulator or your own device.
6. If the template app runs fine, then you're all set!

Contact me if you have any issues getting setup! 
nipun.singh@branch.io or via Slack @Nipun Singh.

## How to create your app
1. Change the name of your project by following [this guide.](https://stackoverflow.com/questions/33370175/how-do-i-completely-rename-my-xcode-project-i-e-inclusive-of-folders).
2. Create a new Apple ID or sign into an existing one in the Xcode preferences. Then you'll be able to change the app's signing under "Signing and Capabilities".
3. Use the [Branch Docs](https://help.branch.io/developers-hub/docs/ios-basic-integration) to integrate the SDK. I reccomend using Swift Package Manager, but feel free to use any of the installation methods. 
4. Choose an API you find interesting to add to your app. [Here's a big list of free API's.](https://github.com/public-apis/public-apis)
5. Integrate the API into your app by setting the apiURL variable to the API's base url.
6. Change the `DataModel.swift` file to fit your API's JSON. [QuickType makes this process easier.](https://app.quicktype.io/) Also, [here's a resource for doing it manually.](https://www.hackingwithswift.com/example-code/language/how-to-convert-json-into-swift-objects-using-codable) 
7. Modify the tableView functions to display you API's data.
8. Use the [Branch Docs](https://help.branch.io/developers-hub/docs/ios-advanced-features) to create, share, and read a deeplink in your app. 

## Tips and Common Issues:
- Make sure to add `import Branch` to the top of any files that use the SDK.
- Double check that the URL your app creates to make the API request is valid.
- Make sure the variable names in your data model match up exactly with the names in the JSON. Eg. `firstName` vs. `first_name`.
- When decoding the JSON to your custom data model, think about whether it's is a single object or array of objects.
- An easy way to test opening deep links is by sharing a link to the Reminders app or copy and pasting a link into Messages.
- You can customize your app's UI in `Main.storyboard`.
- The Apple App Prefix can be found under "Membership" in your [Apple Developer Account.](https://developer.apple.com/account)

The project's code contains comments to help you along with building as well. Feel free to ask me any questions during the process too. Best of luck!
