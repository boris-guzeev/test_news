<?php
namespace Admin;

use Zend\Router\Http\Segment;

return [
    'controllers' => [
        'factories' => [
            Controller\NewsController::class => function($container) {
                return new Controller\NewsController(
                    $container->get(Model\NewsTable::class)
                );
            },
        ]
    ],
    'view_manager' => [
        'template_path_stack' => [
            __DIR__ . '/../view',
        ]
    ],
    'router' => [
        'routes' => [
            'admin_news' => [
                'type' => Segment::class,
                'options' => [
                    'route' => '/admin_news[/:action[/:id]]',
                    'constraints' => [
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+'
                    ],
                    'defaults' => [
                        'controller' => Controller\NewsController::class,
                        'action' => 'index'
                    ]
                ]
            ]
        ]
    ]
];