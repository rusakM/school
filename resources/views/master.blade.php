<html>
    <head>
        <title>Dziennik elektroniczny</title>
        <link rel="stylesheet" href="{{asset('assets/css/app.css')}}" >
        <script src="{{asset('assets/js/functions.js')}}"></script>
    </head>
    <body>
        @include('partials.header')

        <div class="container">
            @yield('content')

        </div>


        @include('partials.footer')

    </body>
</html>