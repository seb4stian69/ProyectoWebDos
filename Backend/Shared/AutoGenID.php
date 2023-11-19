<?php

class GenerarRandomHash {

    private function __construct() { /* Utility Class */ }

    public static function generateSalt(): string {
        $salt = bin2hex(random_bytes(16));
        return $salt;
    }

    public static function generar($input, $salt): string {
        $hashedValue = hash('sha256', $salt . $input);
        return $hashedValue;
    }

    public static function bytesToHex($bytes): string {
        return bin2hex($bytes);
    }

}

?>