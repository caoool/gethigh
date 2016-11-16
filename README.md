# gethigh (Todo the Universe)

"gethigh" is a space holder until we define a product name. BUT, in the meantime while you develop, get high!

## Concept

Public todo list.

Todo lists that are public and community driven:

* Search
* Follow
* Fork

Having these essential features above enables us to build a community driven, helping, planning, and organizing platform (tool/software) that can be applied in so many even unlimited possibilities.

Here I will not put too many conceptual contents here since our focus is to develop, but still, please be high while you read this introduction page, and be sure to read carefully and to follow the conventions strictly listed in the later sections.

## Technology

I will briefly introduce all the core technologies we will be using in this product, including its advantages, resources, links and suggestions.

### Overview

Most websites or web services are written with the helps of frameworks, it eliminates a huge amount of initial setups and configurations, and it really speeds up and simplifies the development process. Frameworks exists on almost every major programming language, and somehow they are very similar to each other that you can always find a clone version in one another. For example, Django in Python corresponds to Rails in Ruby, Sinatra in Ruby corresponds to ExpressJS in Node as well as Flask in Python. Some of the frameworks are light weighted, while some are heavy and fat. They all have its specialties and what is better really depends on the need of the product itself. Each framework may work the best and the easiest with some specific web servers and databases, like PHP works the best with Apache and MySQL (even it has other options).

Here we will be mainly focusing on the MEAN stack:

* M - MongoDB
* E - ExpressJS
* A - AngularJS
* N - NodeJS

It is commonly stacked in the NodeJS world, however, we will not be using this stack even we will be sticking with NodeJS, because ExpressJS is sort of a raw engine, and it takes more efforts to put together a relatively big project. So, that leads us to a great and popular choice in Node's world - Meteor (full stack, frontend coupled default with "Blaze").

### NodeJS

NodeJS is currently the most popular environment for web programming. I can just list a few benefits here:

* It's Javascript, so backend and frontend can be coherent
* Asynchronous, non-blocking which means easier and better concurrent handling
* NPM (package manager) has the greatest number of packages over its compartments
* Meteor is UNIQUE (you must have faith on this one)

Here we will write Javascript in CoffeeScript bacause
* Eliminates all the ';' and '{}'
* Lots of syntax sugers
* Advance features that plain JS does not support like class...
* [jss:CoffeeScript-property](https://atmospherejs.com/jss/CoffeeScript-property) recommended for better OO experience

Other characteristics can be googled by yourself.

### Meteor

Meteor is a full stack framework. It uses NodeJS for backend programming, and Blaze for frontend by default. It also can integrate with AngularJS or ReactJS as the frontend framework.

Some Meteor advantages:

* Fast
  * Logins (accounts) and some other basic functions of web services are pre-written)
  * Port to mobile platform is easy
* Flexible
  * Can integrate other technologies
  * Freestyle which means you can order the structure freely as you wish
* Deploy
  * Existing library "mupx" makes deploy easy as one command line

#### Some Meteor cores

* Reactive data
  * By default, data are reactive (update in real time) without extra work
* DDP
  * Instead of traditional HTTP requests, meteor use DDP (Data Distributed Protocol) to transmit data between server and clients.
  * HTTP post/update/delete request -> Meteor method calls
  * HTTP get request -> publication/subscription
* [AtmosphereJS](https://atmospherejs.com/)
  * Meteor's package manager
  * Great numbers of packages covers common needs
* Folder naming
  * Server - only run on server
  * Client - only run on client
  * Files that are not in above folders will run on both
  * Those special folders can be multiple, and can be sub folders exist anywhere inside the project root

#### To be able to work with Meteor, some readings and understandings are necessary

* [Todo list tutorial](https://www.meteor.com/tutorials/blaze/creating-an-app)
  * Please go over the tutorial at first to have a general picture of how meteor executes
  * Make sure to read [the CoffeeScript version](https://github.com/meteor/todos/tree/CoffeeScript) after finish the tutorial because we will be using CoffeeScript in this project
* [Meteor guide](https://guide.meteor.com/)
  * Recommended for both frontend and backend developers
  * Backend developers need to focus on all sections except VIEW
  * Frontend developers need to focus on VIEW but also will need to have some basic understanding of other elements
  * No need to read it too carefully since we will have sample projects
* [Meteor doc](http://docs.meteor.com/)
  * References, mainly for backend
  * Sometimes guide is not clear enough, need to check here

Other useful learning resources:
* Sample projects written by me
  * [Dance competition rating system](https://github.com/caoool/rating-system-production)
    * Early work, convention and structure not applied
    * Better styles and patterns are in below projects
    * Has internalization (i18n)
    * Has QR code generator
  * [ViteZite](https://github.com/caoool/get-high)
    * Has Facebook/Google logins and API examples
    * Have webhooks that receives push notifications from google and facebook
    * https
  * [YiyaABC](https://github.com/caoool/yiyaabc)
    * OO style (classes)
    * Clear structure (convention that we will use in this project)
    * Most recent work is in **classes** branch (master is empty)
* [Meteor Chef](https://themeteorchef.com/)

#### Suggestions

Webstorm (subset of IntelliJ IDE) has full support of MeteorJS, but code intelligent and auto completion does not work for CoffeeScript, it's the same issue on all other IDE and text editors (Sublime/Atom...).

An IDE doesn't really help much in this situation, so I would recommend using atom or sublime or whatever editor you prefer to code.

[Meteor toys](http://meteor.toys/) could be something useful when you develop, it gives you visual feedback on data or other stuff (like showing dataset on frontend...), details can be found on its website. Do not purchase because you can find free version of the core features in AtmosphereJS.

### MongoDB

MongoDB is a NoSQL database, that means data is not stored in tables, and there is obviously no relations found in between tables. MongoDB stores data as an object, like in a JSON format, so attributes of an object can even be an array, boolean, string, number or even another object.

In Meteor, MongoDB does not have schema, it has advantages and it also causes trouble, so we will use some AtmosphereJS packages to enable schemas as well as hooks (before insertion...) This is essential in every Meteor project.
* [aldeed:simple-schema](https://github.com/aldeed/meteor-simple-schema/)
* [aldeed:collection2](https://github.com/aldeed/meteor-collection2)
* [matb33:collection-hooks](https://github.com/matb33/meteor-collection-hooks/)

Remember that in Meteor, since publication can control what data is available to the frontend when it subscribe to that data set, it's often that frontend does not do complex query. Example: `users.findOne()` will only return one user since the backend publication method only public the current logged in user.

[Robomongo](https://robomongo.org/) is a free cross platform MongoDB visualization tool (also editing). So instead of remember all the usage of MongoDB, just simple using this tool to deal with MongoDB (locally and remotely).

### Frontend

#### Rounting

[iron:router](https://github.com/iron-meteor/iron-router/) is used for routing. This Github page has a guide and quick start guide.

Please put the "router.coffee" file inside client folder to have best performance.

#### [CoffeeScript](http://CoffeeScript.org/)

Please keep in mind that we will not be using Meteor 1.4 feature of "import" folder, so no explicit import is needed. Every function, class or variable is global if you write @ in front of an variable or class. (`@` = `this.` in CoffeeScript)

#### [Jade](https://pugjs.org/api/getting-started.html)

It is been forced to rename to pug due to a trademark issue, so don't freak out if you see pug instead.

Blaze template engine uses Handlebar to wrap variables, objects and reactive data. Examples and guide on how to apply that in Jade can be found [here](https://github.com/mquandalle/meteor-jade).

One useful [tutorial for beginners](https://www.sitepoint.com/jade-tutorial-for-beginners/)

#### [Stylus](http://stylus-lang.com/)

#### [Bootstrap](http://getbootstrap.com/)

Please make sure using its grid system, and the pages need to be **mobile friendly**.

#### [Fontawesome](http://fontawesome.io/)

## Conventions (Style Guide)

Below are some conventions and styles that I grabbed along the way on my programming life. Some are suggestions, while some others need to be strictly followed to ensure an unique peaceful and fluent experience for everyone.

### Git

#### Model and Branching

Please find the model [here](http://nvie.com/posts/a-successful-git-branching-model/).

<img src="http://nvie.com/img/git-model@2x.png" height="720">

Just a few words related to the above link. Some clear instructions on the command lines are been made by this article. Some are not available through a GitHub client. Please follow closely of the branching strategy described, and one should **never commit directly to the master branch**. Also, please remember to **delete** your feature branch after been merged to develop branch.

#### Naming

Type | Style | Comments
--- | --- | --- | ---
branch | my-feature-branch |
commit | Add a class | Please keep in mind that no past tense (No Added)
| Update b module |
| Remove c collection |
commit message | Added <br> -> a feature <br> -> b file | Past tense is used here <br> Seperate each item with new line starting ->
| Updated / removed <br> -> whatever | In case more than one task is done in the commit
| Add / Update / Remove ... <br> -> ... | Without past tense indicate your future plan after this commit

#### Commit

Feel free to commit any time you want except on the master branch. Or you can always send a pull request to develop branch just to be safe.

### Meteor

I apologize at first for making such complex and stupid styles and forcing everyone to follow. Since Meteor is very flexible and freestyle, we must establish some rule we will not struggle later on once the project grows big.

#### Hierarchy / Structure

>/gethigh

>>/models

>>>/lists
>>>>list.coffee  
>>>>lists.coffee  
>>>>methods.coffee

>>>>/server
>>>>>methods.coffee  
>>>>>publications.coffee  

>>>/tags
>>>>tag.coffee  
>>>>tags.coffee

>>>>/server
>>>>>methods.coffee  
>>>>>publications.coffee

>>/views
>>>index.jade  
>>>index.styl  
>>>index.coffee

>>>/layouts
>>>>default-layout.jade  
>>>>not-found-layout.jade

>>>/user
>>>>profile.jade  
>>>>profile.coffee  
>>>>profile.styl

>>>/list
>>>>list.jade  
>>>>list.coffee  
>>>>all-list.jade  
>>>>all-list.coffee

>>/server
>>>startup.coffee  
>>>login-service-config.coffee

>>/client
>>>router.coffee

>>/lib
>>>/helpers
>>>/localizations

>>/common

>>/public
>>>icon.png

>>/private
>>>facebook-credential.yml  
>>>google-credential.yml  
>>>twillio.yml

This is **Extremely Important**, so please take a very close look at this structure above.

> */gethigh/models/lists*
>> Please make sure that folders like list**s** represents a model must be in its **plural form**.

> */gethigh/models/lists/list.coffee*
>> Notice here is list (not lists), this is used to name classes

> */gethigh/models/lists/lists.coffee*
>> Notice here is lists (not list), plural form is used here to indicate this is a Meteor/MongoDB collection

> */gethigh/server/login-service-config.coffee*
>> If name is more than one work, we use **-** in between every word, all lower case

> */gethigh/models/lists/methods.coffee* | */gethigh/models/lists/server/publications.coffee*
>> method**s** and publication**s** file named need to be in **plural form**

Some explaination on **special folder names**

* **server** - anything inside server folder will run on server side only
* **client** - anything inisde client folder will run on client side only
* Anything that not in the above two runs on both sides
* The above two folder can exist anywhere multiple times in the project, even nested
* **public** - store public assets like icons, images
* **private** - store private credentials like google OAuth Tokens, Keys, IDs used by server to connect to 3rd party

#### Tempate Naming

Some view and controllers might have a file name like ***all-lists.jade***, ***all-lists.coffee***.

For ***all-lists.jade*** make sure the associate template in that file is named all**\_**lists by replacing **-** with **\_** like  because then if you double click with mouse of ctrl left right, the long multi word name will be treated as a whole. So the template name definition in Jade will be like `template(name='all_lists')`, and in ***all-lists.coffee***, you call `Tempalte.all_lists.oncreated`.

### Coding

#### Empty Lines
Please make sure between every function, class, blocks, divs -> **2** blank lines.  
Between every ideally group -> **1** blank line.

More styles can be visualized in sample project [yiyaabc](https://github.com/caoool/yiyaabc), notice most recent work is under *classes branch*.

#### Comments
I am aware there are comment generating libraries out there, but so far I haven't found one flawlessly working with CoffeeScript, so in the meantime please follow this commenting style.

~~~CoffeeScript
# !!!
#   IMPORTANT WARNINGS COMES HERE IN CAPTICAL LETTERS
# DESC
#   Briefly describe what it does
# PARAMS
#   {Object} list
#     {[String]} Array of items, String
#     {String} created by user id
#     {Number} number of followers
#     {Date} date created
# RETURN
#   {Boolean}
# FIXME
#   Somehow I don't want to speak now
# TODO
#   Need to add flying feature later
~~~

#### Indentation

Please use hard tab (real tab character instead of spaces), and **1 tab** (2 spaces in equal but since we use hard tab here it is just one tab character).

#### Resources

Some CoffeeScript coding styles guides can be found [here](https://github.com/polarmobile/CoffeeScript-style-guide).
