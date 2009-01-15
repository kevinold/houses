<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en-us">
<head>
   <meta http-equiv="content-type" content="text/html; charset=utf-8" />
   <title></title>
   <meta name="author" content="Kevin Old" />
   <link rel="stylesheet" type="text/css" href="css/ext-all.css" />
<script type="text/javascript" src="ext-base.js"></script>
<script type="text/javascript" src="ext-all.js"></script>
<script type="text/javascript" src="from-markup.js"></script>

   <!-- Homepage CSS -->
   <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen, projection" />
</head>
<style type="text/css">
/* table { border:1px solid #bbb;border-collapse:collapse; }
table td, table th { border:1px solid #ccc;border-collapse:collapse;padding:5px; } */
</style>
<body>

<div class="site">
  <div class="title">
    <a href="/">Houses</a>
    <a class="extra" href="/">home</a>
  </div>


<table id="like-table">
    <thead>
        <tr>
            <th>MLS #</th>
            <th>Address</th>
            <th>City</th>
            <th>Zip</th>
            <th>BR</th>
            <th>BA</th>
            <th>Price</th>
            <th>Total Sqft</th>
            <th>Acres</th>
            <th>URL</th>
        </tr>
    </thead>
    <tbody>
<?php
$handle = new PDO('sqlite:houses.db');
$query = 'SELECT * FROM houses';
$result = $handle->query($query);
while($row = $result->fetch()) {
    //echo 'Name: ' . $house['name'] . '  E-mail: ' . $entry['email'];
?>
        <tr>
            <td></td> <!-- MLS -->
            <td><?= $row['address']?></td> <!-- Address -->
            <td></td> <!-- City -->
            <td></td> <!-- Zip-->
            <td></td> <!-- BR -->
            <td></td> <!-- BA -->
            <td></td> <!-- Price -->
            <td></td> <!-- Total Sqft -->
            <td></td> <!-- Acres -->
            <td><a href="http://www.realtor.com/search/searchresults.aspx?mlslid=">View Listing</a></td> <!-- URL -->
        </tr>
<?php 
} 
?>
        <tr>
            <td>1009311</td> <!-- MLS -->
            <td>804 CHANDLER GROVE DR</td> <!-- Address -->
            <td>Hermitage</td> <!-- City -->
            <td>37076</td> <!-- Zip-->
            <td>3</td> <!-- BR -->
            <td>2.5</td> <!-- BA -->
            <td>233,000</td> <!-- Price -->
            <td>2300</td> <!-- Total Sqft -->
            <td>0.2</td> <!-- Acres -->
            <td><a href="http://www.realtor.com/search/searchresults.aspx?mlslid=1009311">View Listing</a></td> <!-- URL -->
        </tr>
    </tbody>
</table>
        <!--
        <tr>
            <td></td> <!-- MLS -->
            <td></td> <!-- Address -->
            <td></td> <!-- City -->
            <td></td> <!-- Zip-->
            <td></td> <!-- BR -->
            <td></td> <!-- BA -->
            <td></td> <!-- Price -->
            <td></td> <!-- Total Sqft -->
            <td></td> <!-- Acres -->
            <td><a href="http://www.realtor.com/search/searchresults.aspx?mlslid=">View Listing</a></td> <!-- URL -->
        </tr>
        -->

<!-- http://www.realtor.com/search/searchresults.aspx?mlslid=1009311 -->
  
  <div class="footer">
    <div class="contact">
      <p>
      </p>
    </div>
    <div class="contact">
      <p>
      </p>
    </div>
    <div class="rss">
    </div>
  </div>
</div>

</body>
</html>