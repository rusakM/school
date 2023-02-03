@extends('master')

@section('content')
<section class="main-page">
    <div>
        <h2>{{$courseName}}</h2>
        <h4>Nazwa grupy: <a href="{{ url('groups', $group->id) }}">{{$group->groupName}}</a></h4>
        @if (auth()->user()->role === 'teacher')
            <h3>Oceny:</h3>
            <button class="btn" onClick="addGrade()">Dodaj ocenę</button>
            @if (count($grades) > 0)
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
        <h4>Nauczyciel: {{$teacher[0]->name}} {{$teacher[0]->surname}}</h4>
            
            <h3>Oceny:</h3>
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
        
        @if (auth()->user()->role === 'teacher')
            <h4>Nowe zadanie:</h4>
            <form method="POST" action="{{ action('App\Http\Controllers\TasksController@store') }}" class="new-task-form" role="form">
                @csrf
                <label for="taskDescription">Wpisz treść zadania:</label>
                <textarea name="taskDescription" id="newTask" cols="30" rows="5"></textarea>
                <input type="hidden" name="taskCourseId" value="{{$courseId}}" >
                <input type="submit" value="Wyślij" class="btn">
            </form>

            <aside class="alert" id="grade-alert">
                <form method="POST" action="{{ action('App\Http\Controllers\GradesController@store') }}" role="form" id="grade-form">
                    @csrf
                    @if (count($students) > 0)
                    <div class="row">
                        <label for="gradeStudentId">Uczeń:</label>
                        <select name="gradeStudentId" id="gradeStudentId">
                            @foreach($students as $student)
                                <option value="{{$student->studentId}}">{{$student->studentName}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="row">
                        <label for="grade">Ocena:</label>
                        <input type="text" name="grade">
                    </div>
                    <div class="row">
                        <label for="gradeComment">Komentarz do oceny:</label>
                        <input type="text" name="gradeComment" id="gradeComment">
                    </div>
                    <input type="hidden" name="gradeCourseId" value="{{$courseId}}" >
                    <input type="hidden" name="gradeTeacherId" value="{{auth()->user()->teacherId}}" >
                    <div class="row">
                        <input type="submit" value="Dodaj" class="btn">
                        <div class="btn" id="cancelBtn" onClick="closeGradeForm()">Anuluj</div>
                    </div>
                    @else
                        <div class="row">
                            <button class="btn" id="cancelBtn" onClick="closeGradeForm()">Anuluj</button>
                        </div>
                    @endif
                </form>
            </aside>
        @endif
    </div>
</section>
@endsection