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
//    applico( meta: [key: 'name', update: false ], name: 'Access History', path: '/accessHistory', family: 'Access' )


    print "Seeding Rights"
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'nodeGroup', applico: [ name: 'Node Group' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'nodeGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'nodeGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'nodeGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'nodeGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'nodeGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'nodeGroup' )
//
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'nodeUser', applico: [ name: 'Node User' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'nodeUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'nodeUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'nodeUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'nodeUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'nodeUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'nodeUser' )

//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'access', applico: [ name: 'Access Management' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'access' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'access' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'access' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'access' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'access' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'access' )

//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'accessGroup', applico: [ name: 'Access Group' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'accessGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'accessGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'accessGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'accessGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'accessGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'accessGroup' )

//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'managedGroup', applico: [ name: 'Managed Groups' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'managedGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'managedGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'managedGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'managedGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'managedGroup' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'managedGroup' )

//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'managedTeam', applico: [ name: 'Managed Team' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'managedTeam' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'managedTeam' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'managedTeam' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'managedTeam' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'managedTeam' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'managedTeam' )

//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'managedUser', applico: [ name: 'Managed Users' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'managedUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'managedUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'managedUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'managedUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'managedUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'managedUser' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'showMUser', ctrl: 'managedUser', applico: [ name: 'My MU' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'changePassword', ctrl: 'managedUser' )

//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'nodeState', applico: [ name: 'Nodes Status' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'groups', ctrl: 'nodeState' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'group', ctrl: 'nodeState' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'node', ctrl: 'nodeState' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'nodeState' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'job', applico: [ name: 'Jobs' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'job' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'job' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'job' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'job' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'job' )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'job' )

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
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'node' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'node' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'nodeProfile', applico: [ name: 'Node Profile' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'nodeProfile' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'nodeProfile' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'right', applico: [ name: 'Rights & Permissions' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'right' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'right' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'role', applico: [ name: 'Role Administration' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'role' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'role' )

    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'user', applico: [ name: 'User Administration' ] )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'edit', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'create', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'update', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'save', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'delete', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'settings', ctrl: 'user' )
    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'updatePassword', ctrl: 'user' )

//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'index', ctrl: 'accessHistory', applico: [ name: 'Access History' ] )
//    right( meta: [key: [ 'act', 'ctrl' ], update: false], act: 'show', ctrl: 'accessHistory' )


    print "Adding CADMIN Role"
    role( meta: [key: [ 'name' ], update: false], name: 'Cadmin', rights: [ [act: 'index'],
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

    print "Adding CADMIN User"
    user( meta: [key: [ 'email' ], update: false], email: 'cadmin@camp.com', name: 'Cadmin', password: 'Camp@1234', passwordConfirmation: 'Camp@1234', roles: [ [name: 'Cadmin'] ]  )

    print "Seeding is finished."
}
