<?php

use Illuminate\Database\Seeder;

class RolesSeeder extends Seeder
{
    use SeederHelper;

    public function run()
    {
        $roleModel = app(config('permission.models.role'));
        $permissionModel = app(config('permission.models.permission'));

        $viewBackend = $permissionModel::create([
            'name' => config('setting.permission.permission_names.view_backend'),
        ]);

        $manageAuthorization = $permissionModel::create([
            'name' => config('setting.permission.permission_names.manage_authorization'),
        ]);

        foreach (config('setting.permission.role_names') as $roleName) {
            $roleModel::create([
                'name' => $roleName,
            ])->givePermissionTo([
                $viewBackend,
                $manageAuthorization,
            ]);
        }

        $this->seederPermission($roleModel::PERMISSIONS);
        $this->seederPermission($permissionModel::PERMISSIONS);
    }
}
