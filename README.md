MDBrowser
=========

MDBrowser is a very convenient iOS browser that you can present and dismiss with a neat pop up animation,Also supports slide from bottom animation ,has a back and
forward button so the user can navigate the history ,you can open it for the user for example to like your facebook page,
follow on google+ or twitter ,or to simply view web pages on the fly without interrupting your app flow.

should be compiled with ARC ,compatible with iPhone and iPad.


The MIT License (MIT)

Copyright (c) 2013 MD

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


Setup : 

simply add the the classes folder to your project ....thats it

Usage :

1. alloc and initialize the MDBrowser with the frame you like .

2. call ShowInView:(UIView *)View AddOverLayToSuperView:(BOOL)addlyOverlay withAnimationType:(MDBrowserPresetationAnimationType)animation and pass it the view you want the browser to be shown in, the animation type you want ,And whether you want an overlay on top of the super view or not.

3. call LoadUrl:(NSURL*)url with the url you want,Or call LoadHtmlString:(NSString*)html to load html string.

4. if you want to hide the back and forward button just call setButtonsHidden:(BOOL)hidden .

5. set the MDBrowser delegate to your viewController to recieve delegation methods just like the UIWebViewDelegate .


Enjoy
