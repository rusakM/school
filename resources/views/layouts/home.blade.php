@extends('master')

@section('content')
<section class="main-page">
    <div class="hello">
        @auth
            <h2>Witaj {{name}}!</h2>
            <h3>Jesteś zalogowany jako:</h3>
        @endauth

        @guest
            <h3>Najpierw należy się zalogować</h3>
        @endguest
    </div>
</section>
@endsection