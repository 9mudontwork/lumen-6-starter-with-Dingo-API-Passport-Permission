<?php

namespace App\Transformers\Auth;

use App\Models\Auth\User\User;
use App\Transformers\BaseTransformer;

class UserTransformer extends BaseTransformer
{
    public function getResourceKey(): string
    {
        return 'users';
    }

    protected $availableIncludes = [
        'roles',
        'permissions',
    ];

    protected $defaultIncludes = [];

    public function transform(User $user)
    {
        $response = [
            'id' => $user->getHashedId(),
            'email' => $user->email,
            'username' => $user->username,
        ];

        $response = $this->filterData($response, []);

        return $this->addTimesHumanReadable($user, $response);
    }

    public function includeRoles(User $user)
    {
        return $this->collection($user->roles, new RoleTransformer);
    }

    public function includePermissions(User $user)
    {
        return $this->collection($user->permissions, new PermissionTransformer);
    }
}
