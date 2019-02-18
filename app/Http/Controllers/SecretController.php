<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Faker\Provider\DateTime;

class SecretController extends Controller
{
    public function getSecret($hash) {
        $data = DB::table('secrets')
                ->where('hash', $hash)
                ->where(function($query){
                    $query->whereDate('expiresAt', '>', date("Y-m-d H:i:s"))
                          ->orWhere('expiresAt', null);
                })
                ->where('remainingViews', '>', 0)
                ->first();
        if(!$data) {
            abort(404, 'Secret not found');
        }
        if($data->remainingViews > 0) {
            DB::table('secrets')
                ->where('hash', $hash)
                ->update([
                    'remainingViews' => DB::raw('remainingViews - 1'),
                ]);
        }
        if(env('RESPONSE_TYPE') == 'XML') {
            $data = collect($data)->toArray();

            return $xml->asXML();
        }

        return json_encode($data, JSON_PRETTY_PRINT);
    }

    public function createSecret(Request $request) {
        $expireAfter = $request->input('expireAfter');
        $expireAfter = ($expireAfter == 0) ? null : (new \DateTime())->setTimestamp($expireAfter*60);
        $expireAfterViews = $request->input('expireAfterViews');
       
        if($expireAfterViews == 0) {
            abort(405, 'Invalid input');
        }

        DB::table('secrets')->insert([
            'hash' => $request->input('hash') ?? $this->randomHash(),
            'secretText' => $request->input('secret'),
            'remainingViews' => $request->input('expireAfterViews'),
            'expiresAt' => $expireAfter
        ]);

        return 'successful operation';
    }

    private function randomHash()
    {
        do{
            $hash = substr(md5(openssl_random_pseudo_bytes(20)),-32);
            $data = DB::table('secrets')->where('hash', $hash)->get();
        }while(!empty($data->items));

	    return $hash;
    }

    private function secretToXML($data) {
        $xml= new \SimpleXMLElement('<?xml version="1.0"?><Secret></Secret>');
        foreach( $data as $key => $value ) {
            if(is_array($value)) {
                $subnode = $xml->addChild($key);
                array_to_xml($value, $subnode);
            } else {
                $xml->addChild("$key",htmlspecialchars("$value"));
            }
         }

         return $xml;
    }
}
