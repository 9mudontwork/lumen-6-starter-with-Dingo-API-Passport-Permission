<?php

namespace App\Http\Controllers\V1\Backend\Auth\Authorization;

use App\Http\Controllers\Controller;
use App\Transformers\Auth\RoleTransformer;
use App\Transformers\Auth\UserTransformer;
use Dingo\Api\Http\Request;
use App\Models\Auth\User\User;
use App\Models\Auth\Role\Role;


class AuthorizationController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:' . config('setting.permission.permission_names.manage_authorization'));
    }

    /**
     * Assign role to user
     * @api POST /auth/authorizations/assign-role-to-user
     * @param user_id user hash id
     * @param role_id role hash id
     */
    public function assignRoleToUser(Request $request)
    {
        $userId = $this->decodeHash($request->input('user_id'));
        $roleId = $this->decodeHash($request->input('role_id'));

        $user = User::find($userId);

        if (!$user) {
            return $this->response->errorNotFound();
        }

        $user->assignRole($roleId);

        return $this->item($user, new UserTransformer);
    }

    /**
     * Revoke role from user
     * @api POST /auth/authorizations/revoke-role-from-user
     * @param user_id user hash id
     * @param role_id role hash id
     */
    public function revokeRoleFormUser(Request $request)
    {
        $userId = $this->decodeHash($request->input('user_id'));
        $roleId = $this->decodeHash($request->input('role_id'));

        $user = User::find($userId);

        if (!$user) {
            return $this->response->errorNotFound();
        }

        $user->removeRole($roleId);

        return $this->item($user, new UserTransformer);
    }

    /**
     * Assign permission to user
     * @api POST /auth/authorizations/assign-permission-to-user
     * @param user_id user hash id
     * @param permission_id permission hash id
     */
    public function assignPermissionToUser(Request $request)
    {
        $userId = $this->decodeHash($request->input('user_id'));
        $permissionId = $this->decodeHash($request->input('permission_id'));

        $user = User::find($userId);

        if (!$user) {
            return $this->response->errorNotFound();
        }

        $user->givePermissionTo($permissionId);

        return $this->item($user, new UserTransformer);
    }

    /**
     * Revoke permission from user
     * @api POST /auth/authorizations/revoke-permission-from-user
     * @param user_id user hash id
     * @param permission_id permission hash id
     */
    public function revokePermissionFromUser(Request $request)
    {
        $userId = $this->decodeHash($request->input('user_id'));
        $permissionId = $this->decodeHash($request->input('permission_id'));

        $user = User::find($userId);

        if (!$user) {
            return $this->response->errorNotFound();
        }

        $user->revokePermissionTo($permissionId);

        return $this->item($user, new UserTransformer);
    }

    /**
     * Attach permission to role
     * @api POST /auth/authorizations/attach-permission-to-role
     * @param role_id role hash id
     * @param permission_id permission hash id
     */
    public function attachPermissionToRole(Request $request)
    {
        $roleId = $this->decodeHash($request->input('role_id'));
        $permissionId = $this->decodeHash($request->input('permission_id'));

        $role = Role::find($roleId);

        if (!$role) {
            return $this->response->errorNotFound();
        }

        $role->givePermissionTo($permissionId);

        return $this->item($role, new RoleTransformer);
    }

    /**
     * Revoke permission from role
     * @api POST /auth/authorizations/revoke-permission-from-role
     * @param role_id role hash id
     * @param permission_id permission hash id
     */
    public function revokePermissionFromRole(Request $request)
    {
        $roleId = $this->decodeHash($request->input('role_id'));
        $permissionId = $this->decodeHash($request->input('permission_id'));

        $role = Role::find($roleId);

        if (!$role) {
            return $this->response->errorNotFound();
        }

        $role->revokePermissionTo($permissionId);

        return $this->item($role, new RoleTransformer);
    }
}
