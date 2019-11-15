<?php

$api->group([
    'namespace' => 'User',
    'as' => 'users',
], function () use ($api) {

    $api->get('/profile', [
        'as' => 'profile',
        'uses' => 'UserAccessController@profile',
    ]);
});
