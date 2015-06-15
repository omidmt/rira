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
        compile ":rira:0.3.0"
    }

### Version
0.3.0

### Tech

RIRA depends on a number of projects to work properly:

* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [jQuery]

### Domains
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
### Application Name
The application name that appear at top left corner of the every pages can be changed by the following configuration.

```groovy
grails.plugin.rira.appName = 'NewAppName'
```

In fact it sets a default value for KONFIGS.appName, so in run-time through the Konfig page you can set the `appName` property and change it.

### Layout
All controller which extends RiraController (and of course its child, Secure and UnSecure) can use rira layout by default through controller.

The main layout meta tag should be removed from views if rira layout should be used for rendering.

To use RIRA scaffolding templates which is matched with the theme and make the fields compatible with it follow the following steps:

 1. Install scaffold templates (grails install-templates)
 2. Replace scaffold files with rira templates in src directory (src/templates/scaffolding/).
   
It is possible to use home controller for index page. To use it, remove `/` in your grails URlMappings to use rira default one.

### Security
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
    
### Data Sources
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

### Caches
In order to reduce number of DB transactions for the configurations which are mostly readable than changeable some hash 
maps are defined as follow to ease access and improve performance of framework. They are refresh automatically on every 
change in those domain.

Global Configuration (Class.MapName)

Konfig.KONFIGS The key/value of configurations that can be used anywhere and edited in GUI
Node.NODES The hostname/Node dictionary
Node.NODES_IP the hostname/[IP1,...] dictionary that include an array of all connectivity plans' IP of the node
 DataConnection.DATASOURCES name/DataSource keep datasource

### Konfig
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

### Audit Trail
Each save and update action of subclass controllers of SecureController is saved as Audit instance with IP, parameters and username. Other actions 
should be handled manually inside its controller, but they inherited the auditActivity method from RiraController.


### Todo's

 - Write Tests cases
 - Use BDD to test

##### Author
Omid Mehdizadeh

[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[jQuery]:http://jquery.com
[Grails]:http://grails.org