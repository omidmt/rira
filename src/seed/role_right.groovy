/**
 * Created by eomimeh on 9/30/2014.
 */

seed = {

//    applico( meta: [key: 'name', update: false ], name: 'Node Group', path: '/nodeGroup', family: 'Node' )
//    applico( meta: [key: 'name', update: false ], name: 'Node User', path: '/nodeUser', family: 'Node' )
//    applico( meta: [key: 'name', update: false ], name: 'Access Management', path: '/access', family: 'Access' )
//    applico( meta: [key: 'name', update: false ], name: 'Access Group', path: '/accessGroup', family: 'Access' )
//    applico( meta: [key: 'name', update: false ], name: 'Managed Team', path: '/managedTeam', family: 'Access' )
//    applico( meta: [key: 'name', update: false ], name: 'Managed Groups', path: '/managedGroup', family: 'Access' )
//    applico( meta: [key: 'name', update: false ], name: 'Managed Users', path: '/managedUser', family: 'Access' )
//    applico( meta: [key: 'name', update: false ], name: 'My MU', path: '/mu', family: 'Settings' )
//    applico( meta: [key: 'name', update: false ], name: 'Nodes Status', path: '/nodeState', family: 'Node' )
    applico( meta: [key: 'name', update: false ], name: 'Jobs', path: 'job', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Configuration', path: 'konfig', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'User Administration', path: 'user', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Role Administration', path: 'role', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Rights & Permissions', path: 'right', family: 'Admin' )
    applico( meta: [key: 'name', update: false ], name: 'Node Profile', path: 'nodeProfile', family: 'Node' )
    applico( meta: [key: 'name', update: false ], name: 'Nodes', path: 'node', family: 'Node' )
    applico( meta: [key: 'name', update: false ], name: 'Connectivity Plan', path: 'connectivityPlan', family: 'Node' )


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


    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'job', applico: [ name: 'Jobs' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'job' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'konfig', applico: [ name: 'Configuration' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'konfig' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'konfig' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'node', applico: [ name: 'Nodes' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'node' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'nodeProfile', applico: [ name: 'Node Profile' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'nodeProfile' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'right', applico: [ name: 'Rights & Permissions' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'updateEmbeded', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'right' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'role', applico: [ name: 'Role Administration' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'editEmbeded', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'createEmbeded', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'role' )

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
