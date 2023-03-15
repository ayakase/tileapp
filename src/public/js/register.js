function printError(Id,Msg){
    document.getElementById(Id).innerHTML = Msg;
}

function validateForm(){
    var name = document.Form.name.value;
    var account = document.Form.account.value;
    var email = document.Form.email.value;
    var mobile = document.Form.mobile.value;

    var nameErr = accountErr = emailErr = mobileErr = true;

    if(name == "") {
        printError("nameErr", "Hãy viết tên của bạn");
        var elem = document.getElementById("name");
            elem.classList.add("input-2");
            elem.classList.remove("input-1");
    } else {
        var regex = /^[a-zA-Z\s]+$/;                
        if(regex.test(name) === false) {
            printError("nameErr", "Hãy viết tên hợp lệ");
            var elem = document.getElementById("name");
            elem.classList.add("input-2");
            elem.classList.remove("input-1");
        } else {
            printError("nameErr", "");
            nameErr = false;
            var elem = document.getElementById("name");
            elem.classList.add("input-1");
            elem.classList.remove("input-2");
        }
    }


    if(account == "") {
        printError("accountErr", "Hãy tạo tên tài khoản");
    } else {
        printError("accountErr", "");
        nameErr = false;
        var elem = document.getElementById("account");
        elem.classList.add("input-1");
        elem.classList.remove("input-2");
    }


    if(email == "") {
        printError("emailErr", "Hãy viết địa chỉ Email của bạn");
         var elem = document.getElementById("email");
            elem.classList.add("input-2");
            elem.classList.remove("input-1");
    } else {
        
        var regex = /^\S+@\S+\.\S+$/;
        if(regex.test(email) === false) {
            printError("emailErr", "Hãy viết địa chỉ Email hợp lệ");
            var elem = document.getElementById("email");
            elem.classList.add("input-2");
            elem.classList.remove("input-1");
        } else{
            printError("emailErr", "");
            emailErr = false;
             var elem = document.getElementById("email");
            elem.classList.add("input-1");
            elem.classList.remove("input-2");

        }
    }
    
 
    if(mobile == "") {
        printError("mobileErr", "Hãy viết số điện thoại của bạn");
        var elem = document.getElementById("mobile");
            elem.classList.add("input-2");
            elem.classList.remove("input-1");
    } else {
        var regex = /^[0-9]\d{9}$/;
        if(regex.test(mobile) === false) {
            printError("mobileErr", "Tối thiểu 10 chữ số");
            var elem = document.getElementById("mobile");
            elem.classList.add("input-2");
            elem.classList.remove("input-1");
        } else{
            printError("mobileErr", "");
            mobileErr = false;
            var elem = document.getElementById("mobile");
            elem.classList.add("input-1");
            elem.classList.remove("input-2");
        }
    }

    if((nameErr || accountErr || emailErr || mobileErr) == true) {
        return false;
     } 
}

function checkPassword() {
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirm-password").value;
    console.log("password:", password,'\n',"confirmPassword:",confirmPassword);
    let message = document.getElementById("message");

    if(password.length != 0) {
        if(password == confirmPassword) {
            message.textContent = "Passwords match";
            message.style.backgroundColor = "#3ae374";
        } else {
            message.textContent = "Passwords don't match";
            message.style.backgroundColor = "#ff4d4d";
        }
    } else {
        alert("Password can't be empty");
        message.textContent = "";
    }
}