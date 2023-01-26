@extends('master')

@section('content')

<section id="student-form">
    <h2>Logowanie ucznia:</h2>
    <p>Aby się zalogować podaj numer legitymacji i hasło.</p>
    <form action="{{ route('login.perform') }}" method="POST" class="login">
        @csrf
        <div class="form-group">
            <label>Numer legitymacji:</label>
            <input type="text" name="studentId" class="form-control">
            <span class="help-block"></span>
        </div>    
        <div class="form-group">
            <label>Hasło:</label>
            <input type="password" name="password" class="form-control">
            <span class="help-block"></span>
            <input type="hidden" value="student" name="role" >
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Zaloguj">
        </div>
    </form>
    <button class="btn" onClick="toggleForms('teacher')">Zaloguj jako nauczyciel</button>
</section>    
<section id="teacher-form">
    <h2>Logowanie nauczyciela:</h2>
    <p>Aby się zalogować podaj numer nauczyciela i hasło.</p>
    <form action="{{route('login.perform')}}" method="POST" class="login">
        @csrf  
        <div class="form-group">
            <label>Numer nauczyciela:</label>
            <input type="text" name="teacherId" class="form-control">
            <span class="help-block"></span>
        </div>    
        <div class="form-group">
            <label>Hasło:</label>
            <input type="password" name="password" class="form-control">
            <span class="help-block"></span>
        </div>
        <input type="hidden" value="teacher" name="role" >
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Zaloguj">
        </div>
    </form>
    <button class="btn" onClick="toggleForms('student')">Zaloguj jako uczeń</button>
</section>

@endsection