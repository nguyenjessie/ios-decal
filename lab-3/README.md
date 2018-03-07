# iOS DeCal Lab 3 - Multiview Applications (Snapchat Clone Navigation)

## Overview ##
In today's lab, we'll be creating a simple multiview app using navigation controllers. Users should be able to select an image and the app will open a bigger version of the image in a new view.

![alt text](/README-images/previewSnap2.png)

Here's an interactive version of the app, which should help you when creating segues relationships: [interactive mockup](https://invis.io/UQDP88S4W#/255641436_Simulator_Screen_Shot_-_IPhone_SE_-_2017-09-27_At_17-44-11)

This lab will build the basics for your snapChat project. It aims to help you learn more about navigation controllers and tab bar controllers.

To get started, first clone this repository onto your own computer:
	
	git clone https://github.com/iosdecal/ios-decal-lab3-snapchat-clone-nav.git

Open the file `Snapchat Clone.xcodeproj` to start the lab.

## Getting Started ##
Once you have opened the project in Xcode, notice the files present in the Navigator.

### Files we have provided ###
We have provided the following files for you to use. 

1. `ImageFeed.swift` in the `Model` folder - this file contains some useful global variables defined for you.
2. `ImagePickerController.swift` in the `View Controller` folder - this file provides abstracts you from the collection view implementation and provides some useful functions. You will be adding code to this file in this lab.
3. `ImagePreviewViewController.swift` in the `View Controller` folder - a currently dumb view controller, to preview snaps from.
4. `Main.storyboard` in the `View` folder - this is where you will be creating your Views and UI elements (buttons, labels, etc). This file is automatically created for you each time you start a new Xcode project.
5. `Assets.xcassets` in the `View` folder - contains all of the images used in the app (we have only included some sample images, but if you'd like to add your own images to customize the app, add them here). This is another file that is automatically created for you each time you create a new Xcode project.
6. `App Utilies` - contains some other files we won't be using in today's lab.

Once you've become familiar with the files in the app, open Interface Builder (`Main.storyboard`). Notice that there are 3 view controllers already created - your task will be to handle the navigation + data sending between them.

**Note: the two sections below can be completed in any order. You're suggested to read over the whole lab, and play around with the prototype before you begin your implementation.**

## Sending data between view controllers
Whenever a user taps an image in the initial screen, we want the app to show the selected image in a new view. 

We've already created a view controller to display the image in **Main.storyboard** for you, but we have not implemented the transition to the new view and a way for the new view to know which image to display. In this part, you'll need to implement to achieve those 2 goals. You'll need to edit both `ImagePickerController.swift` and `ImagePreviewController.swift`.

In `ImagePickerController.swift`, we've abstracted away the collection view and given you the method, which will get called everytime the user taps an image - Feel free to add any other methods or instance variables you may need:

	func selectImage(_ image: UIImage) {}

## Navigation Controllers + Tab bar Controllers ##

- Create a navigation controller, tab bar controller, and the appropriate segues to handle the remaining navigation between these view controllers in **Main.storyboard**. Use the interactive mockup to check that you've completed this step correctly.
- Create an unwind segue from the "Send" button in **ImagePreviewViewController** to take you back to the **ImagePickerViewController**. Here's a nice article on how to create these: [Create Manual Unwind segues in Swift 3](https://medium.com/@mimicatcodes/create-unwind-segues-in-swift-3-8793f7d23c6f) (works for Swift 4).
- (optional) The default tab icons are not visually helpful for users. Customize the tab icons so that it looks like the image in the Overview section.

Notes: 
1. We've provided the icons in the Assets, so don't need to donwload one or create your own icons.
2. The blank view with a UILabel is just a placeholder. Don't worry. You'll build more stuff in the Snapchat Clone project. 

## Grading ##

Once you've finished the lab, you can check-off using this form: [https://goo.gl/forms/5mOpkPoP1AwnE1612](https://goo.gl/forms/5mOpkPoP1AwnE1612). If you weren't able to finish before 8pm, make sure to fill in the keyword question, and be sure to check-off next week at the beginning of lab.


## Additional Resources ##

- Tutorial videos if you're stuck!
	- [Lab Overview](https://www.youtube.com/watch?v=gKHptiZXs0k) - what the end goal is and little overview of `ImagePickerController.swift`
	- [2 ways to create segues via storyboard](https://www.youtube.com/watch?v=uPyzMMi9aGM) - we went over two ways to create segues in lecture, and it seemed to trip up some people. Here's a video going over both ways.
	- [Embedding view controllers in Navigation controllers and TabBar Controllers](https://www.youtube.com/watch?v=1D-VYVMl6Og&feature=youtu.be)
	- [Passing data between vc's via performForSegue](https://www.youtube.com/watch?v=KodRcYkFfMY) - lengthy video (sorry!) about how to send a string from one view controller to whichever view controller you are seguing to.
