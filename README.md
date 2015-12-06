# DynamicBlurView
A UIView-Class dynamic blur view like UITabbar or UINavagationBar, it can blur the view behind it.

You'd better dont make the blurView have large frame，it'll cause block the main thread. Although I tried GCD,but it caused the CPU overload even the frame is small.So I strongly recommand you could use this demo when your blurView is not big. e.g. a naviagtion bar or a tabbar is absolutely no problem.

Besides,you can set the color whatever you like :)

Blue:

![](DynamicBlurViewDemo/DynamicBlurView_blue.gif)

Red:

![](DynamicBlurViewDemo/DynamicBlurView_red.gif)

Clear:

![](DynamicBlurViewDemo/DynamicBlurView.gif)
