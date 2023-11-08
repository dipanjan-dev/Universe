<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Snaphunt - get your all product here</title>
    <%@include file="links.jsp" %>
      <!-- <link rel="stylesheet" href="../../../resources/static/asset/css/style.css"> -->


  </head>

  <body>
    <%@include file="header.jsp" %>

      <div class="container mt-5 product-details-head">
        <div class="row align-items-center">
          <div class="col-lg-4">

            <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper2">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <img src="${productDetails.getMainImage()}" />
                </div>
                <div class="swiper-slide">
                  <img src="${productDetails.getSecondImage()}" />
                </div>
                <div class="swiper-slide">
                  <img src="${productDetails.getThirdImage()}" />
                </div>
                <div class="swiper-slide">
                  <img src="${productDetails.getFourthImage()}" />
                </div>
              </div>
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
            </div>
            <div thumbsSlider="" class="swiper mySwiper">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <img src="${productDetails.getMainImage()}" />
                </div> 
                <div class="swiper-slide">
                  <img src="${productDetails.getSecondImage()}" />
                </div>
                <div class="swiper-slide">
                  <img src="${productDetails.getThirdImage()}" />
                </div>
                <div class="swiper-slide">
                  <img src="${productDetails.getFourthImage()}" />
                </div>
               
              </div>
            </div>
          </div>
          <div class="col-lg-8">
            <p class="text-muted">Brand : ${productDetails.getBrandName()}</p>
            <h1> ${productDetails.getItemName()}</h1>
            <p class="text-muted">${productDetails.getSubCategory()}</p>
            <hr>
              
            <h4 class="fw-medium"><span style="color : red">${percentageDifference}%</span> <sup>&#8377;</sup> ${productDetails.getBdp()}</h4>
            <p class="text-decoration-line-through" style="">M.R.P : ${productDetails.getMrp()}</p>
            <p class="fs-6">Inclusive of all taxes</p>
            <div class="d-grid gap-2 mb-3 d-md-block">
              <button class="btn btn-outline-secondary" type="button">Add to Cart</button>
              <button class="btn btn-primary" type="button">Buy Now</button>
            </div>
            <p class="fs-6"><span class="fw-bold">EMI</span> Option not available now</p>
            <hr>
            <p class="text-muted">${productDetails.getShortDescription()}</p>
            <p></p>
          </div>
        </div>
      </div>



      <%@include file="script.jsp" %>
      <script>
        var swiper = new Swiper(".mySwiper", {
          spaceBetween: 10,
          slidesPerView: 4,
          freeMode: true,
          watchSlidesProgress: true,
        });
        var swiper2 = new Swiper(".mySwiper2", {
          spaceBetween: 10,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          thumbs: {
            swiper: swiper,
          },
        });
      </script>
  </body>

  </html>