/**
 * Created by eomimeh on 9/30/2014.
 */

seed = {
    applico( meta: [key: 'name', update: false ], name: 'Jobs', path: 'job', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Configuration', path: 'konfig', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'User Administration', path: 'user', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Role Administration', path: 'role', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Rights & Permissions', path: 'right', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Node Profile', path: 'nodeProfile', family: 'Node' )
    applico( meta: [key: 'name', update: false ], name: 'Nodes', path: 'node', family: 'Node' )
    applico( meta: [key: 'name', update: false ], name: 'Audit Log', path: 'audit', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Connectivity Plan', path: 'connectivityPlan', family: 'Node' )
    applico( meta: [key: 'name', update: false ], name: 'Event', path:  'event', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Data Connection', path: 'dataConnection', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Node Types', path: 'nodeType', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Module Types', path: 'module', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'OS', path: 'OS', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Server Types', path: 'serverType', family: 'Admin' )


    print "Seeding Rights"
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'connectivityPlan', applico: [ name: 'Connectivity Plan' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'connectivityPlan' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'connectivityPlan' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'connectivityPlan' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'connectivityPlan' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'connectivityPlan' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'connectivityPlan' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'connectivityPlan' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'connectivityPlan' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'connectivityPlan' )


    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'job', applico: [ name: 'Jobs' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'job' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'konfig', applico: [ name: 'Configuration' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'refreshCache', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'konfig' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'node', applico: [ name: 'Nodes' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'node' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'nodeProfile', applico: [ name: 'Node Profile' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'nodeProfile' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'right', applico: [ name: 'Rights & Permissions' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'updateEmbeded', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'right' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'role', applico: [ name: 'Role Administration' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'role' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'user', applico: [ name: 'User Administration' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'updateEmbeded', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'settings', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'updatePassword', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'lock', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'unlock', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'forcePasswordChange', ctrl: 'user' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'dataConnection', applico: [ name: 'Data Connection' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'dataConnection' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'dataConnection' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'dataConnection' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'dataConnection' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'dataConnection' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'updateEmbeded', ctrl: 'dataConnection' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'dataConnection' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'dataConnection' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'dataConnection' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'audit', applico: [ name: 'Audit Log' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'audit' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'event', applico: [ name: 'Event' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'event' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'event' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'applico', applico: [ name: 'Application Links' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'applico' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'applico' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'applico' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'applico' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'applico' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'updateEmbeded', ctrl: 'applico' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'applico' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'applico' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'applico' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'nodeType', applico: [ name: 'Node Types' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'nodeType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'nodeType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'nodeType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'nodeType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'nodeType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'nodeType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'nodeType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'nodeType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'nodeType' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'serverType', applico: [ name: 'Server Types' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'serverType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'serverType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'serverType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'serverType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'serverType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'serverType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'serverType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'serverType' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'serverType' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'OS', applico: [ name: 'OS' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'OS' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'OS' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'OS' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'OS' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'OS' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'OS' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'OS' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'OS' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'OS' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'module', applico: [ name: 'Module Types' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'module' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'module' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'module' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'module' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'module' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'module' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'module' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'module' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'clone', ctrl: 'module' )

    print "Adding RADMIN Role"
    role( meta: [key: [ 'name' ], update: false], name: 'Radmin', rights: [ [act: 'index', ctrl: '*'],
                                                                            [act: 'show', ctrl: 'user'],
                                                                            [act: 'edit', ctrl: 'user'],
                                                                            [act: 'create', ctrl: 'user' ],
                                                                            [act: 'update', ctrl: 'user'],
                                                                            [act: 'save', ctrl: 'user'],
                                                                            [act: 'delete', ctrl: 'user'],
                                                                            [act: 'index', ctrl: 'user'],
                                                                            [act: 'index', ctrl: 'role'],
                                                                            [act: 'show', ctrl: 'role'],
                                                                            [act: 'edit', ctrl: 'role'],
                                                                            [act: 'create', ctrl: 'role' ],
                                                                            [act: 'update', ctrl: 'role'],
                                                                            [act: 'save', ctrl: 'role'],
                                                                            [act: 'delete', ctrl: 'role'] ])

    print "Adding RADMIN User"
    user( meta: [key: [ 'email' ], update: false], email: 'radmin@rira.com', name: 'Radmin', password: 'Rira@1234', passwordConfirmation: 'Rira@1234', roles: [ [name: 'Radmin'] ]  )

    print "Seeding is finished."
}
