<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Dusterio\LumenPassport\LumenPassport;
use Laravel\Passport\Passport;
use Illuminate\Support\Carbon;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        LumenPassport::routes($this->app->router, [
            // 'prefix' => 'v1/oauth',
        ]);
        LumenPassport::tokensExpireIn(Carbon::now()->addMinutes(config('setting.api.token.access_token_expire')));
        Passport::refreshTokensExpireIn(Carbon::now()->addMinutes(config('setting.api.token.refresh_token_expire')));
    }
}
