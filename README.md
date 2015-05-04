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

### Domains
The default schema of domains is rira, so the defined data source user must has access to that schema.
It is possible to overwrite the default schema with grails.plugin.rira.schema config, like the following sample in Config.groovy
  
    grails.plugin.rira.schema = 'myschema'
    
If application domains have dependency like association to framework tables (like usr or node domains), the schema must be overwritten for having all of the tables in the same schema and keep foreign key constraints working.    

## UI
### Application Name
The application name that appear at top left corner of the every pages can be changed by the following configuration.
    grails.plugin.rira.appName = 'NewAppName'
In fact it sets a default value for KONFIGS.appName, so in run-time through the Konfig page you can set the appName property and change it.

### Layout
All controller which extends RiraController (and of course its child, Secure and UnSecure) can use rira layout by default through controller.

The main layout meta tag should be removed from views if rira layout should be used for rendering.

To use RIRA scaffolding templates which make field compatible with this layout you can install scaffold templates (grails install-templates) and then replace with rira templates in src directory.  

### Security
Each controller can be secured to be authenticated and authorized by extending the SecureController class. It is recommended to extend others by UnSecureController class to use common features of framework.
Having a secure controller means user of this should has the rights of each action to use them. While it is possible to add them after booting application through GUI, but they can be added through a seed file in src/seed directory like the following sample. A default user or applico (menu item) to provide the link to access in menu also can be defined in seed file .

src/seed/access.groovy:
    
    seed = {
        applico( meta: [key: 'name', update: false ], name: 'User Management', path: 'user', family: 'Admin' )
        // Applicp path should not start with /
        
        print "Seeding Rights"
        right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'user', applico: [ name: 'User Management' ] )
        right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'user' )
        right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'user' )
        right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'user' )
        right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'user' )
        right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'user' )
        right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'user' )
        
        print "Adding Role"
        role( meta: [key: [ 'name' ], update: false], name: 'TestRole', rights: [ [act: 'index'], act: 'show', ctrl: 'user'] )
        
        print "Adding User"
        user( meta: [key: [ 'email' ], update: false], email: 'user@app.com', name: 'UserTest', password: 'User@1234', passwordConfirmation: 'User@1234', roles: [ [name: 'TestRole'] ]  )
    }
    

### Todo's

 - Write Tests cases
 - Use BDD to test

##### Author
Omid Mehdizadeh

[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[jQuery]:http://jquery.com
[Grails]:http://grails.org