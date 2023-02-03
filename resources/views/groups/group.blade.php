@extends('master')

@section('content')
<section class="main-page">
    <div>
        <h2>{{$groupName}}</h2>
        @if (count($students) === 0)
            <p>Brak przedmiotów</p>
            @else
            <table>
                <thead>
                    <tr>
                        <th>Id ucznia</th>
                        <th>Imię i nazwisko ucznia</th>
                    </tr>
                </thead>

                @foreach ($students as $student) 
                    <tr>
                        <td>{{$student->studentId}}</td>
                        <td>{{$student->studentName}}</a></td>
                    </tr>
                @endforeach
            </table>
        @endif
        
</div>
</section>
@endsection