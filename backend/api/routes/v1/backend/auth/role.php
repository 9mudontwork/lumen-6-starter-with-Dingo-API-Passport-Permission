<?php
$api->group([
    'namespace' => 'Auth\Role',
    'as' => 'roles',
    'prefix' => 'roles',
], function () use ($api) {

    // CRUD
    $api->post('/', [
        'as' => 'create',
        'uses' => 'RoleController@create',
    ]);
    $api->get('/', [
        'as' => 'reads',
        'uses' => 'RoleController@reads',
    ]);
    $api->get('/{id}', [
        'as' => 'read',
        'uses' => 'RoleController@read',
    ]);
    $api->put('/{id}', [
        'as' => 'update',
        'uses' => 'RoleController@update',
    ]);
    $api->delete('/{id}', [
        'as' => 'delete',
        'uses' => 'RoleController@delete',
    ]);
});
