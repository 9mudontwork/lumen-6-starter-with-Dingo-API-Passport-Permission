<?php

namespace App\Http\Controllers;

use App\Traits\Hashable;
use App\Transformers\BaseTransformer;
use Closure;
use Dingo\Api\Http\Response;
use Dingo\Api\Routing\Helpers;
use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Collection as SupportCollection;
use Laravel\Lumen\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use Hashable;
    use Helpers;

    protected function paginatorOrCollection($paginatorOrCollection, $transformer, array $parameters = [], Closure $after = null)
    {
        $method = '';
        if ($paginatorOrCollection instanceof Paginator) {
            $method = 'paginator';
        } elseif ($paginatorOrCollection instanceof Collection or $paginatorOrCollection instanceof SupportCollection) {
            $method = 'collection';
        }

        $parameters = $this->addResourceKey($transformer, $parameters);

        $response = $this->{$method}(
            $paginatorOrCollection,
            $transformer,
            $parameters,
            $after
        );

        return $this->addAvailableIncludes($response, $transformer);
    }

    private function addResourceKey($transformer, $parameters): array
    {
        $parameters += [
            'key' => $this->checkTransformer($transformer)->getResourceKey(),
        ];
        return $parameters;
    }

    private function checkTransformer($transformer): BaseTransformer
    {
        if (is_string($transformer)) {
            $transformer = app($transformer);
        }
        return $transformer;
    }

    private function addAvailableIncludes(Response $response, $transformer): Response
    {
        return $response->addMeta('include', $this->checkTransformer($transformer)->getAvailableIncludes());
    }

    protected function item($item, $transformer, $parameters = [], Closure $after = null)
    {
        $parameters = $this->addResourceKey($transformer, $parameters);

        $response = $this->response->item($item, $transformer, $parameters, $after);
        return $this->addAvailableIncludes($response, $transformer);
    }
}
