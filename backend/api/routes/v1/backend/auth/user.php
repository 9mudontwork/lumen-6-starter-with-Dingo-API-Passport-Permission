<?php
$api->group([
    'namespace' => 'Auth\User',
    'as' => 'users',
], function () use ($api) {

    $api->group([
        'prefix' => 'users',
    ], function () use ($api) {

        // CRUD
        $api->post('/', [
            'as' => 'create',
            'uses' => 'UserController@create',
        ]);
        $api->get('/', [
            'as' => 'reads',
            'uses' => 'UserController@reads',
        ]);
        $api->get('/{id}', [
            'as' => 'read',
            'uses' => 'UserController@read',
        ]);
        $api->put('/{id}', [
            'as' => 'update',
            'uses' => 'UserController@update',
        ]);
        $api->delete('/{id}', [
            'as' => 'delete',
            'uses' => 'UserController@delete',
        ]);
        $api->put('/{id}/restore', [
            'as' => 'restore',
            'uses' => 'UserController@restore',
        ]);
    });
});