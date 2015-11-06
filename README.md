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

When and where each feature or configuration may apply is indicated in parentheses by **Dev** for development or 
**Runtime** for run-time configuration of application. For example Domain is only applicable in development stage by 
developer, but Application Name can be applied in both development (by developer) and run-time (by administrator). 

### Install
    plugins {
        compile ":rira:0.4.5"
    }
    
For using security module that needs up to date version of bouncycastle lib, add the following lines in the build config 
file (BuildConfig.groovy) to allow using new one. If still getting java security and mismatch exception check the version 
of itext or other dependencies of bcprov lib and update exclusion according to them.

BuildConfig.groovy
    
    build("com.lowagie:itext:2.0.8") {
     excludes "bouncycastle:bcprov-jdk14:138", "org.bouncycastle:bcprov-jdk14:1.38" 
    } 

To use RIRA customized scaffolding templates which is matched with the theme and make the fields compatible with it follow the following steps:

 ```grails install-rira-templates```
 
 
### Version
0.4.5

### Tech

RIRA depends on a number of projects to work properly:

* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [jQuery]

### Domains (Dev)
The default schema of rira domains is rira, so the defined data source user must has access to that schema.
It is possible to overwrite the default schema with grails.plugin.rira.schema config, like the following sample in Config.groovy
  
```groovy
grails.plugin.rira.schema = 'myschema'
```

In case of H2 db you may need to add the following SQL statement at the end of data source url to create schema on db initializing.

```sql
;INIT=CREATE SCHEMA IF NOT EXISTS myschema
```
    
If application domains have dependency like association to framework tables (like User or Node domains), the schema must be overwritten for having all of the tables in the same schema and keep foreign key constraints working.    

## UI
### Application Name (Dev+Runtime)
The application name that appear at top left corner of the every pages can be changed by the following configuration.

```groovy
grails.plugin.rira.appName = 'NewAppName'
```

In fact it sets a default value for KONFIGS.appName, so in run-time through the Konfig page you can set the `appName` property and change it.

### Layout (Dev)
All controller which extends RiraController (and of course its child, Secure and UnSecure) can use rira layout by default through controller.

The main layout meta tag should be removed from views if rira layout should be used for rendering.

#### Scaffold (Dev)
To use RIRA customized scaffolding templates which is matched with the theme and make the fields compatible with it follow the following steps:

 ```grails install-rira-templates```
   
It is possible to use home controller for index page. To use it, remove `/` in your grails URlMappings to use rira default one.

If domain class static cloneable field set to true, then the index page and controller support the clone action/button
 to dulicate an object.

```groovy
static cloneable = true
```

For having a delete button on index page rhe domain must have static deletable set to true.
 
```groovy
static deletable = true
```

Note that the seed for clone action on cloneable domains should be added too. 

### Security (Dev+Runtime)
Each controller can be secured to be authenticated and authorized by extending the SecureController class. It is recommended to extend others by UnSecureController class to use common features of framework.
Having a secure controller means user of this should has the rights of each action to use them. While it is possible to add them after booting application through GUI, but they can be added through a seed file in src/seed directory like the following sample. A default user or applico (menu item) to provide the link to access in menu also can be defined in seed file .

src/seed/access.groovy:

```groovy
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
```

The following konfigs can be used for encryption keys.

* pemPrivateKey The private key in PEM format, if not set default will be set
* pemKeyPassword(optional)  The password of the key, if exists
* pemPublicKey The public key in PEM format, if not set, default one will be set

### Data Sources (Dev+Runtime)
The data sources can be added in run-time through the DataConnection page or its classes as domain. By adding new data 
connection it will try to add it to application context by the defined name. That name can be used when using 
DataConnectionService to execute queries.

For defining a new data connection or data source the following parameters should be clear to add:

* name like 'CAMP', it is the reference to use it in the classes that requires this data source
* data source class (dsClass) like 'org.apache.tomcat.jdbc.pool.DataSource'
* driver like 'com.mysql.jdbc.Driver'
* url like 'jdbc:mysql://localhost/CAMP?zeroDateTimeBehavior=convertToNull'
* username and password
* other is reserved for future use to add some extra connection parameters.

#### How to execute query
```groovy
  // inject data connection service
  def dataConnectionService
  // call executer with data source name
  dataConnectionService.executeQuery( sqlString, dataSrc?.name )
```

The query result can be limited by using the sqlLimit Konfig. The default value is " limit 50000" that is mysql 
expression that covers more than one month data of minutely data.   

### Caches (Dev)
In order to reduce number of DB transactions for the configurations which are mostly readable than changeable some hash 
maps are defined as follow to ease access and improve performance of framework. They are refresh automatically on every 
change in those domain.

Global Configuration (Class.MapName)

Konfig.KONFIGS The key/value of configurations that can be used anywhere and edited in GUI
Node.NODES The hostname/Node dictionary
Node.NODES_IP the hostname/[IP1,...] dictionary that include an array of all connectivity plans' IP of the node
 DataConnection.DATASOURCES name/DataSource keep datasource

### Konfig (Dev+Runtime)
Konfig domain allows to cache configuration that may be used in application that mentioned in Cache section. The value 
of the this cache can be any kind of objects, but they are kept in DB as String, so a converter method may be required 
to convert and make those object in run-time. Also that converter methods can initialize the default values in case it is 
not added. If a key/value is not initialized it may raise an exception in run-time where it is referenced.

Same mechanism can be used for calling cache refresh methods. Method name should be "refreshCaches" on the same class.
 The refresh method of Konfig controller is calling this method on demand.

Having own converter for own configuration, a converter must be defined as a class that suffixed by Konfig and 
the method must be static, like the following class  

```groovy
class XYZKonfig
{
    def static convert() {
        KONFIGS.debug = KONFIGS.debug?.toLowerCase() == 'true'
        KONFIGS.appName = KONFIGS.appName ?: Holders.grailsApplication.mergedConfig.grails.plugin.rira.appName
        KONFIGS.StrictHostKeyChecking = ( KONFIGS.StrictHostKeyChecking?.toLowerCase() == 'yes' || KONFIGS.StrictHostKeyChecking?.toLowerCase() == 'no' ) ? KONFIGS.StrictHostKeyChecking : 'no'
    }    
    def static refreshCaches() {
        SomeClass.refresh()
    }
}
```

#### Using Konfig
Using Konfig object in the code is easy as importing the Konfig class or import the Konfig.KONFIGS statically and point 
to key.

```groovy
import static mt.omid.rira.Konfig.KONFIGS

{
    if(KONFIGS.debug)
        log.debug "Debug message"
}
```

#### Konfigurations

- **debug (true|false[default])** Set logging to DEBUG level if it is true, otherwise set logging to ERROR, it is 
better to call static field of Konfig class, as it supposed to be more efficient (Konfig.debug). 
- **appName (string)** Set the application name that is used in page title and layout, mails and ...
- **StrictHostKeyChecking (yes|no[default])**
- **allowedFailedLogin (int)**
- **sessionInactivityTimeout (int second)**
- **defaultHome (string relative url)**
- **strictAuthorization (true|false[default])**
- **passwordComplexity (string regex)**
- **muPasswordComplexity (string regex)**
- **sqlLimit (int[default: 'limit 50000'])** Limiting criteria which will be appended to the end of query (like limit 10) 
- **smtpServer (string host/IP)**
- **smtpPort (int)**
- **smtpUser (string)**
- **smtpPassword (string)**
- **mailFromAddress (string[default: radmin@rira.app])**
- **sendPasswordInMail (true|false[default])**
- **pemPrivateKey (string)**
- **pemKeyPassword (string)**
- **pemPublicKey (string)**


### Mail Service (Dev)
Th service name that provide mailing is RiraMailService, so the service can be injected where it is required easily by
 
```groovy
def riraMailService
```
 
This service is using async-mail plugin that one also is usgin grail mail plugin. So the config of thos plugin can be 
configured and applied in application.

The application logo on mails can be overwritten by the following config with the proper image file name in asset folder.

```
grails.plugin.rira.logoSmall = 'mylogo128.png'
```

#### Workaround (Dev)
 There is an conflicting issue on initializing rira mail service plugin, to fix it the following line of onConfigChange
  in MailGrailsPlugin.groovy of mail plugin should be commented out.
     
```groovy
// event.ctx.getBean(MailService.class).setPoolSize(mailConfig.poolSize?:null)
```
 
#### Mail Konfigs (Runtime)
The following mail configuration can be set by Konfig

* smtpServer  The host name of smtp server
* smtpPort    The port number of smtp server
* smtpUser    The user for authentication in smtp
* smtpPassword    The password for authentication of smtp
* sendPasswordInMail If set to true, then welcome mail include the password of user, otherwise it won't

There is 2 version of sendMail of this service, one simple that get to, subject and body of mail and another one that 
accept async-mail compatible closure.

```groovy
sendMail( String toAddr, String subj, String body )
sendMail {
to "toAddress@domain.com"
subject "Subject of Mail"
html "<body>Mail</body>"
}
```

### Audit Trail (Dev)
Each save and update action of subclass controllers of SecureController is saved as Audit instance with IP, parameters and username. Other actions 
should be handled manually inside its controller, but they inherited the auditActivity method from RiraController.

### Hiding Menu (Dev)
To hide the menu at page load the following javascript method can be used. It seems it disable toggling it, and cannot 
be shown again.
```javascript
$( '#navmenu' ).offcanvas( 'hide' );
```

##### Author
Omid M. Tourzan @otourzan

[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[jQuery]:http://jquery.com
[Grails]:http://grails.org