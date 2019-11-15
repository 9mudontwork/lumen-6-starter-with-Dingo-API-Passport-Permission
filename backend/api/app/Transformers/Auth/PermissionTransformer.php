<?php

namespace App\Transformers\Auth;

use App\Models\Auth\Permission\Permission;
use App\Transformers\BaseTransformer;

class PermissionTransformer extends BaseTransformer
{
    protected $availableIncludes = [];

    protected $defaultIncludes = [];

    public function transform(Permission $permission)
    {
        return [
            'id' => $permission->getHashedId(),
            'name' => $permission->name,
        ];
    }

    public function getResourceKey(): string
    {
        return 'permissions';
    }
}
