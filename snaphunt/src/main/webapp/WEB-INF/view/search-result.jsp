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
    <div class="container-fluid mt-5">
    <div class="row">
      <div class="col-lg-3">
        <p class="fw-medium fs-6 text-muted" style="font-size: 14px !important;">Let's customize what you exactly want</p>
        

        <p class="section-title">Brand</p>

        
        <c:forEach items="${userSearch}" var="product">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
          <label class="form-check-label" for="flexCheckDefault">
            ${product.getBrandName()}
          </label>
        </div>
        </c:forEach>
        
      </div>
      <div class="col-lg-9">
        <div class="row">
          
        <c:forEach items="${userSearch}" var="product">
            <div class="col-lg-4">
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
        </c:forEach>
      </div>
      </div>
    </div>
  </div>
        



    <%@include file="script.jsp" %>
</body>
</html>