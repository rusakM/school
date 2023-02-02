@extends('master')

@section('content')
<section class="main-page">
    <div>
        <h2>{{$courseName}}</h2>
        <h3>Oceny</h3>
        @if (auth()->user()->role === 'teacher')
            @if (count($grades))
            <table>
                    <thead>
                        <tr>
                            <th>Uczeń</th>
                            <th>Ocena</th>
                            <th>Komentarz</th>
                            <th>Średnia ocen ucznia</th>
                        </tr>
                    </thead>
                    @foreach ($grades as $grade)
                        <tr>
                            <td>{{ $grade->studentName }}</td>
                            <td>{{ $grade->grade }}</td>
                            <td>{{ $grade->gradeComment }}</td>
                            <td>{{ $grade->gradesAvg }}</td>
                        </tr>
                    @endforeach
                </table>
            @else
                <p>Brak ocen dla wybranego przemiotu</p>
            @endif
        @else
            @if (count($grades) > 0) 
                <table>
                    <thead>
                        <tr>
                            <th>Ocena</th>
                            <th>Komentarz</th>
                            <th>Nauczyciel</th>
                        </tr>
                    </thead>
                    @foreach ($grades as $grade)
                        <tr>
                            <td>{{ $grade->grade }}</td>
                            <td>{{ $grade->gradeComment }}</td>
                            <td>{{ $grade->teacherName }}</td>
                        </tr>
                    @endforeach
                    <tr>
                        <td><b>Średnia ocen:</b></td>
                        <td><b>{{ $grades[0]->gradesAvg }}</b></td>
                    </tr>
                </table>
            @else
                <p>Brak ocen dla wybranego przemiotu</p>
            @endif

        @endif
        @if (count($tasks) > 0)
            <h3>Lista zadań domowych:</h3>
            <ol>
                @foreach ($tasks as $task)
                    <li>{{ $task->taskDescription }}</li>
                @endforeach
            </ol>

        @endif
        {{json_encode($grades)}}
    </div>
</section>
@endsection