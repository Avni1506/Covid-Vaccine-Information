<!DOCTYPE html>

<html>

    <head>

        <title>Logout Page</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width">

    </head>

    
    <body>
        <% session.invalidate(); 
        %> 
		<jsp:forward page="main.jsp"/>
    </body>

</html>