function addUser()
{
//    alert("Inside");
    var email = document.getElementById('addContact:email').value;
    var password = document.getElementById('addContact:password').value;
    var confirmPassword = document.getElementById('addContact:confirmPassword').value;
    var createdBy = document.getElementById('addContact:createdBy').value;
    var firstName = document.getElementById('addContact:firstName').value;
    var lastName = document.getElementById('addContact:lastName').value;
    var dob = document.getElementById('example1').value;
    var height = document.getElementById('addContact:heightId').value;
    var maritalStatus = document.getElementById('addContact:maritalStatus:0').value;
    var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    var reg = /^[a-zA-Z]*$/;



    if (!regEmail.test(email))
    {
        document.getElementById('addContact:validateEmail').style.display = "block";
        return false;
    } else {

        document.getElementById('addContact:validateEmail').style.display = "none";
    }
    if (password === '')
    {
        document.getElementById('addContact:validatePassword').style.display = "block";
        return false;
    } else {
        document.getElementById('addContact:validatePassword').style.display = "none";
    }
    if (password !== confirmPassword)
    {
        document.getElementById('addContact:validateConfirmPassword').style.display = "block";
        return false;
    } else {
        document.getElementById('addContact:validateConfirmPassword').style.display = "none";
    }
    if (createdBy === '')
    {
        document.getElementById('addContact:validateCreatedBy').style.display = "block";
        return false;
    } else {
        document.getElementById('addContact:validateCreatedBy').style.display = "none";
    }
    if (firstName === '' || !reg.test(firstName))
    {
        document.getElementById('addContact:validateFirstName').style.display = "block";
        return false;
    } else {
        document.getElementById('addContact:validateFirstName').style.display = "none";
    }
    if (lastName === '' || !reg.test(lastName))
    {
        document.getElementById('addContact:validateLastName').style.display = "block";
        return false;
    } else {
        document.getElementById('addContact:validateLastName').style.display = "none";
    }
    if (dob === '')
    {
        document.getElementById('addContact:validatedob').style.display = "block";
        return false;
    } else {
        document.getElementById('addContact:dob').value = dob;
        document.getElementById('addContact:validatedob').style.display = "none";
    }
    if (height === '')
    {
        document.getElementById('addContact:validateHeight').style.display = "block";
        return false;
    } else {
        document.getElementById('addContact:validateHeight').style.display = "none";
    }

    return true;

}
function preEnterFields()
{
    document.getElementById('addContact:gender:0').checked = true;
    document.getElementById('addContact:maritalStatus:0').checked = true;

}
function validatedob(id)
{
//    alert("In");
    document.getElementById(id).value="";
}