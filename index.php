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
            <th>Subdivision</th>
            <th>Year</th>
            <th>Total Sqft</th>
            <th>Acres</th>
            <th>Notes</th>
            <th>URL</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
<?php
$handle = new PDO('sqlite:houses.db');
$query = 'SELECT * FROM houses';
$result = $handle->query($query);
while($row = $result->fetch()) {
    $imgbase = substr($row['mls'], 0, -2) . '000';
    $baths = $row['total_full_baths'] + $row['total_half_baths'];
?>
        <tr>
            <td><img src="http://pictures.realtracs.net/<?= $imgbase ?>/<?= $row['mls'] ?>/lr<?= $row['mls'] ?>-1.jpg" /></td>
            <td><?= $row['mls'] ?></td> <!-- MLS -->
            <td><?= $row['address'] ?></td> <!-- Address -->
            <td><?= $row['city'] ?></td> <!-- City -->
            <td><?= $row['zip'] ?></td> <!-- Zip-->
            <td><?= $row['bedrooms'] ?></td> <!-- BR -->
            <td><?= $row['baths'] ?></td> <!-- BA -->
            <td><?= $row['listing_price'] ?></td> <!-- Price -->
            <td><?= $row['subdivison'] ?></td> <!-- Subdivision -->
            <td><?= $row['year_built'] ?></td> <!-- Year built-->
            <td><?= $row['square_feet'] ?></td> <!-- Total Sqft -->
            <td><?= $row['acres'] ?></td> <!-- Acres -->
            <td><?= $row['notes'] ?></td> <!-- Notes -->
            <td><a href="http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=listing_detail&property_id=<?= $row['mls'] ?>">View Listing</a></td> <!-- URL -->
            <td><?= $row['our_status'] ?></td> <!-- Our Status -->
        </tr>
<?php 
} 
?>
    </tbody>
</table>

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
