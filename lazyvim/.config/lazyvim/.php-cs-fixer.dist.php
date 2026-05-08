<?php

$configClass = 'PhpCsFixer\\Config';

return (new $configClass())
    ->setRiskyAllowed(false)
    ->setRules([
        '@PER-CS' => true,
        'array_syntax' => ['syntax' => 'short'],
    ])
    ->setIndent("  ")
    ->setLineEnding("\n");
