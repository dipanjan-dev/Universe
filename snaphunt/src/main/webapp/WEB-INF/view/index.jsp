<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Snaphunt - get your all product here</title>
    <%@include file="links.jsp" %>
  </head>

  <body>
    <%@include file="header.jsp" %>
    <div class="container mt-3 rounded-3">
      <div class="swiper HomemySwiper rounded-3 shadow-lg">
        <div class="swiper-wrapper rounded-3 shadow-lg">
          <div class="swiper-slide sliders rounded-3"
            style="background: url('https://res.cloudinary.com/dcbbqwxzr/image/upload/v1692549914/SAMSUNG_Z_FOLD_iwjk1b.png') ;">

          </div>
          <div class="swiper-slide sliders rounded-3"
            style="background: url('https://res.cloudinary.com/dcbbqwxzr/image/upload/v1692550267/SAMSUNG_Z_FOLD_1_zb69si.png');">

          </div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
      </div>
    </div>
      <div class="container">

        <div class="row">
          <div class="section-header">
            <h5 class="section-title">Best smart phone for you</h5>
            <a href="">View all</a>
          </div>
     
          <c:forEach items="${Allproducts}" var="product">
            <c:if test="${product.getCategory()=='electronics'}">
              <div class="col-lg-3">
                <a href="/product-view/${product.getProductId()}/${product.getItemName()}">
                  <div class="card shopping-card">
                    <img src="${product.getMainImage()}" class="card-img-top">
                    <div class="card-body">
                      <h5 class="card-title">${product.getItemName()}</h5>
                      <p class="card-text"><span>&#8377;</span> ${product.getBdp()}</p>
                    </div>
                  </div>
                </a>
              </div>
            </c:if>
          </c:forEach>
        </div>
        <div class="row">
          <div class="section-header">
            <h5 class="section-title">Top Brand For footwear</h5>
            <a href="">View all</a>
          </div>
          <c:forEach items="${Allproducts}" var="product">
            <c:if test="${product.getSubCategory()=='Shoes and Footwear'}">
              <div class="col-lg-3">
                <a href="/product-view/${product.getProductId()}/${product.getItemName()}">
                  <div class="card shopping-card">
                    <img src="${product.getMainImage()}" class="card-img-top">
                    <div class="card-body">
                      <h5 class="card-title">${product.getItemName()}</h5>
                      <p class="card-text"><span>&#8377;</span>  ${product.getBdp()}</p>
                    </div>
                  </div>
                </a>
              </div>
            </c:if>
          </c:forEach>
        </div>

        <div class="row">
          <div class="section-header">
            <h5 class="section-title">Best home decoration ideas for your home</h5>
            <a href="">View all</a>
          </div>
          <c:forEach items="${Allproducts}" var="product">
            <c:if test="${product.getCategory()=='home-furniture'}">
              <div class="col-lg-3">
                <a href="/product-view/${product.getProductId()}/${product.getItemName()}">
                  <div class="card shopping-card">
                    <img src="${product.getMainImage()}" class="card-img-top">
                    <div class="card-body">
                      <h5 class="card-title">${product.getItemName()}</h5>
                      <p class="card-text"><span>&#8377;</span>  ${product.getBdp()}</p>
                    </div>
                  </div>
                </a>
              </div>
            </c:if>
          </c:forEach>
        </div>
        </div>
        <div class="container-fluid bg-white mt-5">
          <div class="container">

        <div class="row">
          <div class="section-header">
            <h5 class="section-title">Best product for you</h5>
            <a href="">View all</a>
          </div>
          <div class="swiper slider-cards">
            <div class="swiper-wrapper">
              <c:forEach items="${Allproducts}" var="product">
                <div class="swiper-slide">
                  <div class="col-lg-12">
                    <a href="/product-view/${product.getProductId()}/${product.getItemName()}">
                      <div class="card shopping-card">
                        <img src="${product.getMainImage()}" class="card-img-top">
                        <div class="card-body">
                          <h5 class="card-title">${product.getItemName()}</h5>
                          <p class="card-text"><span>&#8377;</span>  ${product.getBdp()}</p>
                        </div>
                      </div>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </div>
      </div>
      <%@include file="script.jsp" %>
        <script>
          var swiper = new Swiper(".HomemySwiper", {
            loop: true,
            grabCursor: true,
            effect: "creative",
            creativeEffect: {
              prev: {
                shadow: true,
                translate: ["-20%", 0, -1],
              },
              next: {
                translate: ["100%", 0, 0],
              },
            },
            navigation: {
              nextEl: ".swiper-button-next",
              prevEl: ".swiper-button-prev",
            },
          });

          var swiper = new Swiper(".slider-cards", {
            slidesPerView: 4,
            spaceBetween: 30,
            pagination: {
              el: ".swiper-pagination",
              clickable: true,
            },
          });
          if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(function (position) {
              const latitude = position.coords.latitude;
              const longitude = position.coords.longitude;

              // Using the Google Maps Geocoding API
              const geocoder = new google.maps.Geocoder();
              const latLng = new google.maps.LatLng(latitude, longitude);

              geocoder.geocode({ 'location': latLng }, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                  if (results[0]) {
                    const address = results[0].formatted_address;
                    console.log("Address:", address);
                  } else {
                    console.error("No results found");
                  }
                } else {
                  console.error("Geocoder failed due to:", status);
                }
              });
            }, function (error) {
              console.error("Error getting location:", error.message);
            });
          } else {
            console.error("Geolocation is not spanported in this browser");
          }

          // AIzaSyAwBFmt4LN9HC8Ve9ytawhEm5l6WaWCj0g
        </script>

  </body>

  </html>