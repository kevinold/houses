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
/* table td, table th { valign: center; font-size: 120%; } */
</style>
<body>
<a name="top"></a>
<div class="site">
  <div class="title">
    <a href="/">Houses</a>
    <!-- <a class="extra" href="/">home</a> -->
    <a class="extra" href="#driven_by">Driven By</a>
    <a class="extra" href="#havent_seen">Haven't Seen</a>
  </div>

<p>Below are houses we are considering.  The data in the tables can be sorted by column header. Click on the photo or "View" link to view the full MLS listing.</p>

<?php
$handle = new PDO('sqlite:houses.db');

$stats = array('driven_by', 'havent_seen');// , 'finalist', 'shown', 'dislike');
foreach ($stats as $status) {

$query = "SELECT * FROM houses where our_status = '$status'";
$result = $handle->query($query);
?>
<a name="<?= $status ?>"></a>
<table id="<?= $status ?>-table">
    <thead>
        <tr>
            <th></th>
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
while($row = $result->fetch()) {
    $imgbase = substr($row['mls'], 0, -3) . '000';
    $baths = $row['total_full_baths'] + $row['total_half_baths'];
?>
        <tr>
            <td><a target="_blank" href="http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=listing_detail&property_id=<?= $row['mls'] ?>"><img width="100" src="http://pictures.realtracs.net/<?= $imgbase ?>/<?= $row['mls'] ?>/lr<?= $row['mls'] ?>-1.jpg" border="0" /></a></td>
            <td><?= $row['mls'] ?></td> <!-- MLS -->
            <td><?= $row['address'] ?></td> <!-- Address -->
            <td><?= $row['city'] ?></td> <!-- City -->
            <td><?= $row['zip'] ?></td> <!-- Zip-->
            <td><?= $row['bedrooms'] ?></td> <!-- BR -->
            <td><?= $baths ?></td> <!-- BA -->
            <td><?= $row['listing_price'] ?></td> <!-- Price -->
            <td><?= $row['subdivision'] ?></td> <!-- Subdivision -->
            <td><?= $row['year_built'] ?></td> <!-- Year built-->
            <td><?= $row['square_feet'] ?></td> <!-- Total Sqft -->
            <td><?= $row['acres'] ?></td> <!-- Acres -->
            <td><?= $row['notes'] ?></td> <!-- Notes -->
            <td><a target="_blank" href="http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=listing_detail&property_id=<?= $row['mls'] ?>">View</a></td> <!-- URL -->
            <td><?= $row['our_status'] ?></td> <!-- Our Status -->
        </tr>
<?php 
} 
?>
    </tbody>
</table>
<br/>
<br/>
<a href="#top">top</a>
<br/>
<br/>
<?php 
} 
?>

<!-- http://www.realtor.com/search/searchresults.aspx?mlslid=1009311 -->
  
  <div class="footer">
    <div class="contact">
      <p>&copy; 2009 <a href="http://www.kevinold.com">Kevin Old</a>
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
