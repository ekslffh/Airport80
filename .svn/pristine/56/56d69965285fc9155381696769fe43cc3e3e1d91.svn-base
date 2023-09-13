<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>





    <div class="pagetitle" style="margin-top:20px; margin-left:20px;">
      <h1 style="margin-left:20px;">Profile</h1>
      
    </div>

    <section class="section profile" style="width:500px;">
      <div class="row">
        <div class="col-xl-4">

          <div class="card" style="width:150px;">
          
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
<!--               <img src="http://localhost/Airport80/resources/images/airport/loop2.jpg" alt="Profile" class="rounded-circle"> -->
			<img src="${pageContext.request.contextPath }/resources/images/emp/${emp.fileGroup.detailList[0].fiNm}" class="rounded-circle"/>
			
				
				
              <h2>${emp.empNm }</h2>
              <h3>${emp.empRoleNm }</h3>
              
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card"  style="height:400px; width:600px;" >
            <div class="card-body pt-3"  >
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" style="font-size:25px;">정보</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview" >
                 

                  <div class="row" style="font-size:20px;">
                    <div class="col-lg-3 col-md-4 label ">사번</div>
                    <div class="col-lg-9 col-md-8">${emp.empNo }</div>
                  </div>

                  <div class="row" style="font-size:20px;">
                    <div class="col-lg-3 col-md-4 label">부서</div>
                    <div class="col-lg-9 col-md-8"> 
                    <c:choose>
		        <c:when test="${emp.empDeptNo == 1201}">
		            <c:choose>
		                <c:when test="${emp.empTeam == 31}">인사</c:when>
		                <c:when test="${emp.empTeam == 32}">회계</c:when>
		            </c:choose>
		        </c:when>
		        <c:when test="${emp.empDeptNo == 1202}">운영</c:when>
		        <c:when test="${emp.empDeptNo == 1203}">보안</c:when>
		        <c:when test="${emp.empDeptNo == 1204}">인프라</c:when>
		    </c:choose>	
                    
                    
                    </div>
                  </div>

                  <div class="row" style="font-size:20px;">
                    <div class="col-lg-3 col-md-4 label">입사일</div>
                    <div class="col-lg-9 col-md-8">${emp.empJoinDt }</div>
                  </div>
                  <div class="row" style="font-size:20px;">
                    <div class="col-lg-3 col-md-4 label">연락처</div>
                    <div class="col-lg-9 col-md-8">${emp.empContact }</div>
                  </div>

                  <div class="row" style="font-size:20px;">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8">${emp.empEmail }@${emp.empEmailDo }</div>
                  </div>

                  <div class="row" style="font-size:20px;">
                    <div class="col-lg-3 col-md-4 label">주소</div>
                    <div class="col-lg-9 col-md-8">${emp.empAddr }</div>
                  </div>
                  


       

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form>
           
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="fullName" type="text" class="form-control" id="fullName" value="Kevin Anderson">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="about" class="col-md-4 col-lg-3 col-form-label">About</label>
                      <div class="col-md-8 col-lg-9">
                        <textarea name="about" class="form-control" id="about" style="height: 100px">Sunt est soluta temporibus accusantium neque nam maiores cumque temporibus. Tempora libero non est unde veniam est qui dolor. Ut sunt iure rerum quae quisquam autem eveniet perspiciatis odit. Fuga sequi sed ea saepe at unde.</textarea>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="company" class="col-md-4 col-lg-3 col-form-label">Company</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="company" type="text" class="form-control" id="company" value="Lueilwitz, Wisoky and Leuschke">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Job" class="col-md-4 col-lg-3 col-form-label">Job</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="job" type="text" class="form-control" id="Job" value="Web Designer">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Country" class="col-md-4 col-lg-3 col-form-label">Country</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="country" type="text" class="form-control" id="Country" value="USA">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="address" type="text" class="form-control" id="Address" value="A108 Adam Street, New York, NY 535022">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="phone" type="text" class="form-control" id="Phone" value="(436) 486-3538 x29071">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="email" class="form-control" id="Email" value="k.anderson@example.com">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Twitter Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="twitter" type="text" class="form-control" id="Twitter" value="https://twitter.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Facebook" class="col-md-4 col-lg-3 col-form-label">Facebook Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="facebook" type="text" class="form-control" id="Facebook" value="https://facebook.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="instagram" type="text" class="form-control" id="Instagram" value="https://instagram.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="linkedin" type="text" class="form-control" id="Linkedin" value="https://linkedin.com/#">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>



              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>
    
<script>
CKEDITOR.replace('empImg', {	
	filebrowserImageUploadUrl: '${pageContext.request.contextPath }/uploadImage.do',
});

</script>

