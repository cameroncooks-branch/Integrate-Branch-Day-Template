# Integrate Branch Day Template
Basic iOS app template for Integrate Branch Day. As I continue testing and getting feedback, I may make make changes to the template code to make the process easier. 

## How to prepare for Integrate Branch Day
1. Install Xcode via Self Service
2. Download this repo
3. Open the BuildAnAppDayTemplate.xcodeproj
4. Run the app on the simulator or your own device
5. If the app template app runs fine, then you're all set!

Contact me if you have any issues getting setup! 
nipun.singh@branch.io or via Slack @Nipun Singh.

## How to create your app
1. (Optional) Change the name of your project by following [this guide.](https://stackoverflow.com/questions/33370175/how-do-i-completely-rename-my-xcode-project-i-e-inclusive-of-folders).
2. Create a new Apple ID or sign into an existing one in the Xcode preferences. Then you'll be able to change the app's signing under "Signing and Capabilities".
3. Use the [Branch Docs](https://help.branch.io/developers-hub/docs/ios-basic-integration) to integrate the SDK. I reccomend using Swift Package Manager, but feel free to use any of the installation methods. 
4. Choose any API you find interesting to add to your app. [Here's a solid list.](https://github.com/public-apis/public-apis)
5. Integrate the API into your app by setting the apiURL variable to the API's base url.
6. Change the DataModel.swift file to fit your API's JSON. [QuickType makes this process easier.](https://app.quicktype.io/) Also, [here's a resource for doing it manually.](https://www.hackingwithswift.com/example-code/language/how-to-convert-json-into-swift-objects-using-codable) 
7. Modify the last tableView function to display you API's data however you'd like.
8. Use the Branch Docs to create, share, and read a deeplink to your app. 

The project's code contains comments to help you along with building as well. Best of luck!
