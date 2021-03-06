<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Patient</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body{
                font-family: "Arial Black";
                position: relative;
                height: 100vh;
                width: 100%;
                background: url("4.jpg");
                background-size: cover;
                background-position: center;
                color: #FFa500; 
            }
            .form-container{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8));
                width: 400px;
                padding: 50px 30px;
                border-radius: 10px;
                box-shadow: 7px 7px 60px #000;
            }
            h1{
                text-transform: uppercase;
                font-size: 2em;
                text-align: center;
                margin-bottom: 2em;
            }
            .control input{
                width: 100%;
                display: block;
                padding: 10px;
                color: #222;
                border: none;
                outline: none;
                margin: 1em 0;
            }
            .control input[type="submit"]{
                background: red;
                color: #000;
                text-transform: uppercase;
                font-size: 1.5em;
                opacity: .7;
                transition: opacity .3s ease;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1> Employee Login </h1>
            <form action="loginforemp" method="POST" onclick="return validate()">
                <div class="control">
                    <label for="name"> Employee ID </label>
                    <input type="text" name="empid" id="eid"><span id="error"></span><br>
                </div>
                <div class="control">
                    <label for="password"> Password </label>
                    <input type="password" name="psw" id="pass"><span id="error1"></span><br>
                </div>

                <div class="control">
                    <input type="submit" value="Login" name="btnlogin">
                </div>
            </form>

        </div>
        <script>
    function validate(){
        var id=document.getElementById('eid').value;
        var idregx=/[E]/;
        var idres=idregx.test(id);
                
//                var pass=document.getElementById('pass').value;
//                var dpass=/(?=.\d)(?=.[a-z])(?=.*[A-Z]).{8,}/;
//                var ddpass=dpass.test(pass);
        if(idres === false)
        {
                document.getElementById('error').style.color='red';
                document.getElementById('error').innerHTML='Please enter valid Employee Id';
                return false;
        }
//                if(ddpass === false)
//                {
//                    document.getElementById('error1').style.color='red';
//                    document.getElementById('error1').innerHTML='Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters';
//                    return false;
//                }
        document.getElementById('error').style.color='none';
        document.getElementById('error').innerHTML="";
        return true;
        }
        </script>
    </body>
</html>