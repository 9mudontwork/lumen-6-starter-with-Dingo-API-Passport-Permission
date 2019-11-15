<?php

namespace App\Http\Controllers\V1\Backend\Auth\User;

use App\Http\Controllers\Controller;
use App\Transformers\Auth\UserTransformer;
use Dingo\Api\Http\Request;
use App\Models\Auth\User\User;

class UserController extends Controller
{
    private $emailRules = 'required|email:filter|unique:users,email';
    private $usernameRules = 'required|unique:users,username';
    private $passwordRules = 'required';

    public function __construct()
    {
        $permissions = User::PERMISSIONS;

        $this->middleware('permission:' . $permissions['create'], ['only' => 'create']);
        $this->middleware('permission:' . $permissions['read'], ['only' => 'read']);
        $this->middleware('permission:' . $permissions['reads'], ['only' => 'reads']);
        $this->middleware('permission:' . $permissions['update'], ['only' => 'update']);
        $this->middleware('permission:' . $permissions['delete'], ['only' => 'delete']);
    }

    /**
     * create new user
     * @api POST /auth/users
     * @param email
     * @param username
     * @param password
     */
    public function create(Request $request)
    {
        $attributes = $this->validate($request, [
            'email' => $this->emailRules,
            'username' => $this->usernameRules,
            'password' => $this->passwordRules,
        ]);

        $attributes['password'] = app('hash')->make($attributes['password']);

        return $this->item(User::create($attributes), new UserTransformer)->statusCode(201);
    }

    /**
     * get all user
     * @api GET /auth/users
     */
    public function reads()
    {
        $user = User::paginate();

        return $this->paginatorOrCollection($user, new UserTransformer);
    }

    /**
     * get user
     * @api GET /auth/users/{id}
     * @param id user hash id
     */
    public function read(string $id)
    {
        $user = User::find($this->decodeHash($id));

        if (!$user) {
            return $this->response->errorNotFound();
        }

        return $this->item($user, new UserTransformer);
    }

    /**
     * update user
     * @api PUT /auth/users
     * @param id
     * @param email
     * @param username
     * @param password
     */
    public function update(Request $request, string $id)
    {
        $attributes = $this->validate($request, [
            'email' => $this->emailRules,
            'username' => $this->usernameRules,
            'password' => $this->passwordRules,
        ]);

        $attributes['password'] = app('hash')->make($attributes['password']);

        $user = User::find($this->decodeHash($id));

        if (!$user) {
            return $this->response->errorNotFound();
        }

        $user->update($attributes);

        return $this->item($user, new UserTransformer);
    }

    /**
     * delete user
     * @api DELETE /auth/users/{id}
     * @param id user hash id
     */
    public function delete(string $id)
    {
        $id = $this->decodeHash($id);
        if (app('auth')->id() == $id) {
            $this->response->errorForbidden('You cannot delete your self.');
        }

        $user = User::find($id);

        if (!$user) {
            return $this->response->errorNotFound();
        }

        $user->delete($id);

        return $this->response->noContent();
    }

    /**
     * restore user
     * @api PUT /auth/users/{id}/restore
     * @param id user hash id
     */
    public function restore(string $id)
    {
        $id = $this->decodeHash($id);
        User::withTrashed()->whereId($id)->restore();
        $user = User::find($id);

        return $this->item($user, new UserTransformer);
    }
}
