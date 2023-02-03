@extends('master')

@section('content')
<section class="main-page">
    <div>
        <h2>Lista przedmiotów:</h2>
        @if (count($courses) === 0)
            <p>Brak przedmiotów</p>
            @else
            <table>
                <thead>
                    <tr>
                        <th>Nazwa przedmiotu</th>
                        <th>{{auth()->user()->role === 'teacher' ? 'Grupa' : 'Prowadzący'}}</th>
                    </tr>
                </thead>

                @foreach ($courses as $course) 
                    <tr>
                        <td><a href="{{url('courses', $course['id'])}}">{{$course['courseName']}}</a></td>
                        <td>{{auth()->user()->role === 'teacher' ? $course['groupName'] : $course['name'].' '.$course['surname']}}</td>
                    </tr>
                @endforeach
            </table>
        @endif
        
</div>
</section>
@endsection