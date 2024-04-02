<?php

$finder = \PhpCsFixer\Finder::create()
    ->exclude('vendor')
    ->exclude(['tests/Integration/fixtures'])
    ->in(__DIR__);

$config = new \PhpCsFixer\Config();

return $config->setRules([
    '@Symfony' => true,
    'array_syntax' => ['syntax' => 'short'],
    'linebreak_after_opening_tag' => true,
    'ordered_imports' => true,
    'phpdoc_add_missing_param_annotation' => true,
    'phpdoc_order' => true,
    'yoda_style' => false,
    'no_superfluous_phpdoc_tags' => false,
    'declare_strict_types' => true,
])
    ->setIndent("  ")
    ->setLineEnding("\n")
    ->setFinder($finder);
