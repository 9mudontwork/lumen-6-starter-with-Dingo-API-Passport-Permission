<?php

namespace App\Models\Auth\Permission;

use App\Traits\Hashable;
use Illuminate\Database\Eloquent\Builder;

class Permission extends \Spatie\Permission\Models\Permission
{
    use Hashable;

    const PERMISSIONS = [
        'read' => 'permission read',
        'reads' => 'permission reads',
    ];
}
