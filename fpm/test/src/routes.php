<?php
// Routes

$app->get('/', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    $response->getBody()->write("Hello, World\n");

    return $response;
});

$app->get('/slow', function($request, $response, $args) {

    sleep(10);

    $response->getBody()->write("Hello, Slow World\n");
    return $response;
});

$app->get('/slow2', function($request, $response, $args) {

    $db = new mysqli('mysqlfpm', 'test', 'test', 'test');
    for($i = 0; $i < 50000; $i++)
    {
        $db->query("select now()");
    }

    $response->getBody()->write("Hello, Slowish World\n");
    return $response;
});
