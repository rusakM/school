<header>
    <a href="{{ URL::to('/') }}"><img src="{{ URL::asset('/img/logo.png') }}" class="logo" alt="logo"></a>
    <ul class="header-desktop">
    @auth
        <li><a href="{{ URL::to('courses-list') }}">Przedmioty</a></li>
        <li><a href="{{ URL::to('grades-list') }}">Oceny</a></li>
        <li><a href="{{ URL::to('logout') }}">Wyloguj</a></li>
    @endauth
        
    @guest
        <li><a href="{{ URL::to('login') }}">Logowanie</a></li>
    @endguest
    </ul>
    <span class="header-button" onClick="toggleMenu();">&#9776;</span>
</header>