<?php

namespace App\Http\Controllers\V1\Backend\Auth\Permission;

use App\Http\Controllers\Controller;
use App\Transformers\Auth\PermissionTransformer;
use App\Models\Auth\Permission\Permission;

class PermissionController extends Controller
{
    public function __construct()
    {
        $permissions = Permission::PERMISSIONS;

        $this->middleware('permission:' . $permissions['reads'], ['only' => 'reads']);
        $this->middleware('permission:' . $permissions['read'], ['only' => 'show']);
    }

    /**
     * get all permission
     * @pai /auth/permissions
     */
    public function reads()
    {
        $permission = Permission::paginate();
        return $this->paginatorOrCollection($permission, new PermissionTransformer);
    }

    /**
     * get permission
     * @api /auth/permissions/{id}
     * @param id hash permission id
     */
    public function read(string $id)
    {
        $permission = Permission::find($this->decodeHash($id));

        if (!$permission) {
            return $this->response->errorNotFound();
        }

        return $this->item($permission, new PermissionTransformer);
    }
}
