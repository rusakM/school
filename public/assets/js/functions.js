const toggleForms = (value) => {
    const teacherForm = document.getElementById("teacher-form");
    const studentForm = document.getElementById("student-form");
    if (value === "teacher") {
        teacherForm.style.display = "block";
        studentForm.style.display = "none";
    } else {
        teacherForm.style.display = "none";
        studentForm.style.display = "block";
    }
};

const toggleMenu = () => {
    const menu = document.getElementById("header-mobile");
    if (menu.style.display !== "flex") {
        menu.style.display = "flex";
    } else {
        menu.style.display = "none";
    }
};

const newGrade = (studentId, courseId) => {
    const aside = document.createElement("aside");
    aside.classList.add("alert");
    aside.id = "new-grade";

    aside.innerHTML = `
    <span onclick="closeGradeAlert()" class="close-btn">&#9747;</span>
    <form method="POST" action="addgrade.php?student=${studentId}&course=${courseId}">
      <label for="grade">Ocena</label>
      <input type="number" max="6" min="1" name="grade" id="grade">
      <label for="comment">Komentarz</label>
      <input type="text" id="comment" name="comment">
      <input type="submit" value="Wyślij" class="btn">
    </form>`;

    document.querySelectorAll(".container")[0].appendChild(aside);
};

const closeGradeAlert = () => {
    document.getElementById("new-grade").remove();
};
