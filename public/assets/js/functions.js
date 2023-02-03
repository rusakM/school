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

const addGrade = () => {
    document.getElementById("grade-alert").style.display = "block";
};

const closeGradeForm = (event) => {
    document.getElementById("grade-alert").style.display = "none";
};
