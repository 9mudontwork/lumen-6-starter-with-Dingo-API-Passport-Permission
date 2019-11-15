<?php

namespace App\Http\Controllers\V1\Frontend\User;

use App\Http\Controllers\Controller;
use App\Transformers\Auth\UserTransformer;

class UserAccessController extends Controller
{
    /**
     * get current auth user
     * @api GET /profile
     */
    public function profile()
    {
        return $this->item($this->user(), new UserTransformer);
    }
}
