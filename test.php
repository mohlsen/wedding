<html>
<head>
<title>Test</title>
</head>
<body>
<?php 
    /* Connecting, selecting database */ 
    $link = mysql_connect("localhost", "mohlsen2_rsvp", "chute4rsvp") 
        or die("Could not connect : " . mysql_error()); 

    mysql_select_db("mohlsen2_rsvp") or die("Could not select database" . mysql_error()); 

    $query = $_POST["query"];
    print "Your SQL Query: <b>";
    print $query;
    print "</b><br><p>";

$result = mysql_query($query); 

print "<table border=1>";
print "<tr>"; 
print "<th>InviteID</th>"; 
print "<th>LastName</th>"; 
print "<th>FirstName</th>"; 
print "<th>People</th>"; 
print "<th>Invited</th>"; 
print "<th>Adult</th>"; 
print "<th>Child </th>"; 
print "<th>Infant</th>"; 
print "<th>Total</th>"; 
print "<th>Phone</th>"; 
print "<th>ListID</th>";
print "</tr>"; 

while ($row = mysql_fetch_array($result)) 
{ 
print "<tr>"; 

print "<td>" . $row["InviteID"] . "</td>";
print "<td>" . $row["LastName"] . "</td>";
print "<td>" . $row["FirstName"] . "</td>";
print "<td>" . $row["People"] . "</td>";
print "<td>" . $row["Invited"] . "</td>";
print "<td>" . $row["Adult"] . "</td>";
print "<td>" . $row["Child"] . "</td>";
print "<td>" . $row["Infant"] . "</td>";
print "<td>" . $row["Total"] . "</td>";
print "<td>" . $row["Phone"] . "</td>";
print "<td>" . $row["ListID"] . "</td>";

print "</tr>"; 
}

print "</table>"; 
mysql_free_result($result);
mysql_close($link); 


?>

</body>
</html>