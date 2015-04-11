# RIRA

RIRA is a light boilerplate application framework to provide basic needs of it  as plugin. It is a grails plugin. It provides the following feature.
  - Access Management
    - Authentication and Authurization
    - User <-> (n) Role <-> (n) Right
    - Right -> Controller/Action
  - Global run-time configurable configuration (Konfig)
  - Job control as asynchronous quartz jobs
  - Automatic menu access according to user's rights (Applico)
  - Node administration to manage external nodes connectivity in application
  - Notification module (email or SMS)

### Install
    plugins {
        compile ":rira:0.1.1"
    }

### Version
0.1.1

### Tech

RIRA depends on a number of projects to work properly:

* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [jQuery]
* ...

### Todo's

 - Write Tests cases
 - Use BDD to test

##### Author
Omid Mehdizadeh

[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[jQuery]:http://jquery.com
[Grails]:http://grails.org