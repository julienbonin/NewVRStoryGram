<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="site/css/normalize.css">
  <link rel="stylesheet" href="site/css/style.css">
  <script src="https://aframe.io/releases/0.9.0/aframe.min.js"></script>
</head>

<body>
  <header>
    <div class="logo_div"><a href="index.php"><img src="site/img/LOGO.jpg" alt="VRStoryGram Logo" id="logo"></a></div>
    <div class="nav_1_div"><a href="site/inc/readme.php">What is VRStoryGram</a></div>
    <div class="nav_2_div"><a href="site/inc/createAccount.php">Create</a></div>
    <div class="nav_3_div"><a href="site/inc/about.php">Team VRStroyGram</a></div>
    <div class="nav_4_div"><a href="site/inc/login.php">Login</a></div>
  </header>
  <div class="content_div">
    <div class="index_content_div">

      <div class="featured_content"><iframe width="100%" height="100%"  allowfullscreen frameborder="0" src="http://vrstorygram.local/vr/<?php include('site/scripts/latest_storygram_script.php'); echo $latest_storygram; ?>"></iframe></div>

      <div class="newest_content">
        <h1>Latest StoryGrams</h1>
        <div class="latest_item_div">
          <div class="latest_item_1"> <iframe width="100%" height="100%" allowfullscreen frameborder="0" src="http://vrstorygram.local/vr/test-space-2"></iframe> </div>
          <div class="latest_item_2"> <iframe width="100%" height="100%"  allowfullscreen frameborder="0" src="http://vrstorygram.local/vr/test-space-4"></iframe> </div>
          <div class="latest_item_3"> <iframe width="100%" height="100%"  allowfullscreen frameborder="0" src="http://vrstorygram.local/vr/test-space-1"></iframe></div>
          <div class="latest_item_4"> <iframe width="100%" height="100%"  allowfullscreen frameborder="0" src="http://vrstorygram.local/vr/test-space-5"></iframe> </div>
        </div>
      </div>

    </div>
  </div>
  <footer>
    <div class="social_media_div">
      <h2>Get Social!</h2>
      <div class="social_media_icon_div">
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-youtube"></a>
        <a href="#" class="fa fa-instagram"></a>
        <a href="#" class="fa fa-twitter"></a>
      </div>
    </div>
    <div class="secondary_nav_div"><a href="vr/login">Admin Login</h5></div>
  </footer>
</body>
</html>
