![](https://cdn.filestackcontent.com/LRCZezewSAKGl8Dj7GNQ)
 
#### *TLDR*
Axolotl is a social space for posting short messages with friends. The goal of the project is to get back to basics and provide a non-trolled environment to share posts.

### Contents
* [About](#about)
  * [Overview](#overview)
  * [Release Platforms](#release-platforms)
  * [User Data](#user-data)
  * [License](#license)
  * [Version History](#version-history)
  
* [Application Usage](#application-usage)
  * [Creating Accounts](#creating-accounts)
  * [Posting](#posting)
  * [Fellows](#fellows)
  * [User info](#user-info)
  * [Deleting accounts](#deleting-accounts)
  * [Web App](#web-app)
  
* [Building and Developing](#building-and-developing)
  * [Dependencies](#dependencies)
  * [API](#api)
  * [Deployment](#deployment)
* [Contact](#contact)

  



## About
#### Overview
Axolotl was built to get back to basics. To keep things positive. There are no counters for people to keep track of popularity. There are no comment boards in which to get into flame wars. There is simply posting and following.

We believe this approach allows people to express themselves as they want, without getting trolled. We want to be conscious of what features are and why we are adding them, with our core mission: build a social space on the web that is geared toward positivity.

#### Release Platforms
Axolotl currently supports web browsers only, and scales to mobile devices, tablets, and desktop systems. Concurrent development of mobile apps for iOS and Android will begin shortly.

#### User Data
Aside from the actual post data, iamges, usernames, e-mail addresses, and connections Axolotl does not store anything. We do not do data analytics to increase our userbase, we do not sell or give away your user information (including your e-mail), we do not advertise or sell advertising space. We are commited to these values.

#### License
Axolotl is licensed under the GNU GPLv3 license. The license.txt file in the root directory of this project contains the details.

#### Version History
Version Number | Version Name | Release Date | Notes
---------------|--------------|--------------|------
0.5.0 | Atomic Tangerine | 03/20/18 | Alpha Release. Posting, @ links, account editing
0.6.0 | Blizzard Blue | *tbd* | Linkable posts, clickable links in posts, hash tags

## Application Usage
#### Creating Accounts
Axolotl is pretty no nonsense when it comes to account creation. Simply visit the [home page](http://axolotl.network) and click on *sign up*. You will be prompted to enter a username, password, and e-mail address....that is all! Nice and streamlined. You will be notified if your username selection is already taken, or if your password or e-mail are not valid.

#### Posting
To post on a mobile device simply tap the Axolotl logo that is centered in the footer. A post box will slide up and you can make your post. This is doable from the home screen or the profile screen (pretty much anywhere that the logo appears).

To post on a desktop device (including laptops and some larger tablets), click on the pencil icon withiin the lefthand user container. This is available from most pages.

Posts are limited to 200 characters. You can link to another user within your post by typing an **@** symbol immediately followed by the username like so: `@username`. You can tack punctuation on to the end of an **@** link and it will still link correctly. Links to websites are not currently active, nor are hash tags, but they will be coming in the next release!

#### Fellows
Axolotl is all about your fellows. When a friend joins, have them send you their username. You can navigate on either desktop or mobile to the fellows page and enter their username to add them as a fellow. Once this is done, they will be listed on your fellows page with a yellow star next to their name. Any time you see a star it means one of two things: if it is filled in yellow then that user is a fellow; if it is not filled in, that user is not a fellow, but can be added as one by clicking the star. Another way to find new fellows is to follow **@** links to new users and follow them. 

Once you have followed a fellow you can visit your home page to see your feed (that is where all of your new fellow's posts will show up). Users are not told that they ah ve a new fellow. Nor can following fellows be blocked. That said, direct communication is not possible through the platform and information is generally one way, unless both parties make each other their fellow (at which point posts could talk back and forth). as such, if you don't like what someone is saying and don't want to hear it anymore, simply click the filled ins tar to say goodbye to that fellow.

#### User Info
Axolotl features a few customizable options. A user can update their e-mail address, update their bio, and update their user image. The image uploader will accept any image that does not have a transparency layer (more info on this to come). It will resize the image appropriately and center it as your user icon. The bio, which appears on your profile to other users, is a palce to say a few things about yourself, if you'd like. It is limited to 85 characters. On mobile all of these options can be updated from the settings pannel.  On desktop they can be accessed from the hamburger menu.

#### Deleting Accounts
To delete your account simply go to the settings menu on mobile (the hamburger menu on desktop) and select *delete account*. You will be asked if you are sure, then prompted to enter your password. If everything works out: **POOF!** ...your account is gone. There is no recovery, this is a permanent option. Upon deletion, your username will become available to new users and there is no guarantee you will be able to get it back. We will, of course, be sad to see you go.

#### Web App
Axolotl is being developed as a web app. What this means, especially for Android users, is that you can save the app to your phone's home screen (via the 3 dots at the top right of chrome for Android). Once you do so, the app will run much more like a native app: splash screen, no more address bar, separate task switching. We are working on developing some offline features as well! It is possible to save a web app on iOS devices as well, and we are ironing out the kinks currently. Results will vary at the moment from phone to phone, but we certainly recommend trying this out!



![](https://axolotl.network/images/axolotl-login.png)|![](https://axolotl.network/images/axolotl-home.png)|![](https://axolotl.network/images/axolotl-post.png)
:-----:|:----:|:-------:

## Building and Developing
#### Dependencies
Axolotl is built on a Python 2.7 back end utilizing the [*Bottle*](https://bottlepy.org/docs/dev/) web framework. You will need to install Python 2.7 if you do not have it and then use *PIP* to get Bottle. You will also need to *PIP* Pillow (formerly PIL, Pythin Image Library). All other Python imports are from the standard library.

Because the alpha release (*Atomic Tangerine*) uses SQLite3 for the database there will be no need to isntall a database to your environment. One will be created for you upon running *main.py*. 

Jquery is used on the front end, and at Alpha is included via a CDN. This will be updated for the beta release (*Blizzard Blue*) to be included as a local file.

#### API
A full RESTful web service is in the works for Axolotl. At present it is not full featured enough to be officially documented or released as part of the base package. However, it is a high priority for the development team and various read options should be available very soon. Talks are ongoing as to what other CRUD operations are appropriate to include for this application.

#### Deployment
There are a number of deployment options that can be read about in the documentation for *Bottle*. The current deployment model for the [live site](https://axolotl.network) is via an Apache2 server. To use *Bottle* with Apache2 you must set up WSGI on the server, as such that can be considered another dependency if you deploy in this manner. 

## Contact
Axolotl is developed and maintained by:
[Brian Evans](https://github.com/sloumdrone) and [Lori Mitchell](https://github.com/lmitchell524)
Please feel free to reach out with any questions or comments!
