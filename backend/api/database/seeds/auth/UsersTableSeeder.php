<?php

use App\Models\Auth\User\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    use SeederHelper;

    public function run()
    {
        $system = factory(User::class)->create([
            'email' => 'system@system.com',
            'username' => 'system',
            'password' => app('hash')->make('system'),
        ]);

        $admin = factory(User::class)->create([
            'email' => 'admin@admin.com',
            'username' => 'admin',
            'password' => app('hash')->make('admin'),
        ]);

        $user = factory(User::class)->create([
            'email' => 'user@user.com',
            'username' => 'user',
            'password' => app('hash')->make('user'),
        ]);

        $system->assignRole(config('setting.permission.role_names.system'));
        $admin->assignRole(config('setting.permission.role_names.admin'));

        $this->seederPermission(User::PERMISSIONS);
    }
}
