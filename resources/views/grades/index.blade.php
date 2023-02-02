@extends('master')

@section('content')
<section class="main-page">
    <div class="hello">
        <h2>Moje oceny</h2>
        @if (auth()->user()->role === 'teacher')
            <p>Aby wyświetlić oceny zaloguj się na konto ucznia</p>
        @else
            @if (count($grades) > 0)
                <table>
                    <thead>
                        <tr>
                            <th>Przedmiot</th>
                            <th>Oceny</th>
                            <th>Średnia ocen</th>
                        </tr>
                    </thead>
                    @foreach ($grades as $grade)
                        <tr>
                            <td><a href="{{url('courses', $grade->courseId)}}">{{ $grade->courseName }}</a></td>
                            <td>{{ $grade->grades }}</td>
                            <td>{{ $grade->gradesAvg }}</td>
                        </tr>
                    @endforeach
                </table>
            @else

            @endif

            {{json_encode($grades)}}
        @endif
    </div>
</section>
@endsection