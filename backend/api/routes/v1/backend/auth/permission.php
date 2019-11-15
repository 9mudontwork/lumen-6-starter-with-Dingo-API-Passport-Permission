<?php
$api->group([
    'namespace' => 'Auth\Permission',
    'as' => 'permissions',
    'prefix' => 'permissions',
], function () use ($api) {

    // CRUD
    $api->get('/', [
        'as' => 'reads',
        'uses' => 'PermissionController@reads',
    ]);
    $api->get('/{id}', [
        'as' => 'read',
        'uses' => 'PermissionController@read',
    ]);
});
