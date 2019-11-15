<?php

namespace App\Models\Auth\Role;

use App\Traits\Hashable;
use Illuminate\Database\Eloquent\Builder;

class Role extends \Spatie\Permission\Models\Role
{
    use Hashable;

    const PERMISSIONS = [
        'create' => 'role create',
        'read' => 'role read',
        'reads' => 'role reads',
        'update' => 'role update',
        'delete' => 'role delete',
    ];
}
