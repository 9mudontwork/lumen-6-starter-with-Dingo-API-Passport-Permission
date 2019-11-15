<?php

namespace App\Http\Controllers\V1\Backend\Auth\Role;

use App\Http\Controllers\Controller;
use App\Transformers\Auth\RoleTransformer;
use Dingo\Api\Http\Request;
use App\Models\Auth\Role\Role;

class RoleController extends Controller
{
    public function __construct()
    {
        $permissions = Role::PERMISSIONS;

        $this->middleware('permission:' . $permissions['create'], ['only' => 'create']);
        $this->middleware('permission:' . $permissions['read'], ['only' => 'read']);
        $this->middleware('permission:' . $permissions['reads'], ['only' => 'reads']);
        $this->middleware('permission:' . $permissions['update'], ['only' => 'update']);
        $this->middleware('permission:' . $permissions['delete'], ['only' => 'delete']);
    }

    /**
     * create new role
     * @api POST /auth/roles
     * @param name
     */
    public function create(Request $request)
    {
        $role = Role::create([
            'name' => $request->input('name'),
        ]);
        return $this->item($role, new RoleTransformer)->statusCode(201);
    }

    /**
     * get all roles
     * @api GET /auth/roles
     */
    public function reads()
    {
        $role = Role::paginate();

        return $this->paginatorOrCollection($role, new RoleTransformer);
    }

    /**
     * get roles
     * @api GET /auth/roles/{id}
     * @param id hash user id
     */
    public function read(string $id)
    {
        $role = Role::find($this->decodeHash($id));

        if (!$role) {
            return $this->response->errorNotFound();
        }

        return $this->item($role, new RoleTransformer);
    }

    /**
     * update roles
     * @api PUT /auth/roles
     * @param id role hash id
     * @param name role name
     */
    public function update(Request $request, string $id)
    {
        $role = Role::find($this->decodeHash($id));

        if (!$role) {
            return $this->response->errorNotFound();
        }

        $role->update(['name' => $request->input('name')]);

        return $this->item($role, new RoleTransformer);
    }

    /**
     * delete roles
     * @api /auth/roles/{id}
     * @param id role hash id
     */
    public function delete(string $id)
    {
        $id = $this->decodeHash($id);
        $role = Role::find($id);

        if (!$role) {
            return $this->response->errorNotFound();
        }

        $role->delete($id);

        return $this->response->noContent();
    }
}
