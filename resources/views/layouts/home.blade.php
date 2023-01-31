@extends('master')

@section('content')
<section class="main-page">
    <div class="hello">
        @auth
            <h2>Witaj {{auth()->user()->name}} {{auth()->user()->surname}}!</h2>
            <h3>Jesteś zalogowany jako:&nbsp;
                {{auth()->user()->role === 'teacher' ? "Nauczyciel" : "Uczeń"}}
            </h3>
        @endauth

        @guest
            <h3>Najpierw należy się zalogować</h3>
        @endguest
    </div>
</section>
@endsection