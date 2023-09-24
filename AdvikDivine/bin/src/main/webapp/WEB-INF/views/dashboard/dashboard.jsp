<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- <%@ include file="/WEB-INF/views/beneficiary/ben_privacy_policy.jsp"%>
<%@ include file="/WEB-INF/views/beneficiary/otpModal.jsp"%> --%>

	<style type="text/css">
		#mw_transactionStatus > div, #TotalBeneficiaryPayment > div, #BeneficiaryPaymentStatus > div, #mw_BenefitedBeneficiaryStatus > div,
		#AccountVerificationStatus > div, #aVsNonAadharBeneficiaryStatus > div {
			width: 100%;
			height: 250px; 
		}
		#enrolledVsPaid > div {
			width: 100%;
			height: 350px !important;
		}
	</style>

<div class="content body_dashboard">
	<div class="panel-header bg-primary-gradient">
		<div class="page-inner py-4">
			<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div>
					<h2 class="text-blue pb-2 fw-bold"><spring:message code="mst.dashboard.dash"></spring:message></h2>
				</div>
				<div class="ml-md-auto">
					<a href="${contextPath}" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i class="fa fa-home"></i></a> 
					<a href="#" class="btn btn-sm btn-border btn-blue btn-round mr-2">/<spring:message code="mst.dashboard.dash"></spring:message></a>
				</div>
			</div>
		</div>
	</div>
<c:if test="${role ne 'admin' &&  not empty roleLevel && not empty levelId }">
	<div class="page-inner mt--5 pb-0">
		<div class="row mt-4">
			<div class="col-md-12">
				<div class="card kpi_card">
                    <div class="kpi_card_left">
                        <div class="single_kpi single_kpi_xl">
                            <div class="kpi_content">
                                <div class="svg_con">
									<?xml version="1.0" standalone="no"?>
									<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
									"http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
									<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
									width="128.000000pt" height="128.000000pt" viewBox="0 0 128.000000 128.000000"
									preserveAspectRatio="xMidYMid meet">

									<g transform="translate(0.000000,128.000000) scale(0.100000,-0.100000)"
									fill="#000000" stroke="none">
									<path d="M572 1263 c-40 -19 -78 -66 -88 -108 -4 -18 -28 -49 -60 -78 -35 -31
									-64 -71 -86 -115 -30 -60 -33 -75 -33 -152 1 -64 6 -96 21 -130 29 -63 119
									-195 150 -219 22 -18 25 -26 22 -76 l-3 -56 -132 -63 c-139 -65 -174 -90 -193
									-136 -16 -39 -9 -125 10 -125 11 0 16 16 20 61 3 34 11 69 19 78 17 20 143 86
									164 86 7 0 23 -13 35 -30 22 -30 46 -38 56 -21 4 5 -6 23 -20 41 -15 17 -25
									32 -23 34 2 2 23 13 46 25 50 25 63 46 63 101 0 39 1 40 28 33 35 -10 109 -10
									145 0 26 7 27 6 27 -36 0 -53 17 -78 69 -102 23 -10 41 -21 41 -25 0 -17 -80
									-78 -123 -95 -46 -17 -105 -17 -196 1 -26 5 -33 4 -29 -7 9 -27 61 -43 138
									-43 89 0 153 26 211 86 20 21 42 38 48 38 19 0 146 -67 162 -86 8 -9 16 -44
									19 -78 4 -45 9 -61 20 -61 19 0 26 86 10 125 -19 46 -54 71 -193 136 l-132 63
									-3 53 c-3 51 -1 55 42 101 50 52 88 149 67 170 -15 15 -25 2 -39 -49 -18 -64
									-52 -106 -112 -137 -73 -38 -145 -35 -216 9 -70 43 -104 112 -104 211 0 41 4
									83 10 93 5 10 48 48 94 83 l84 65 21 -22 c12 -12 59 -44 105 -70 118 -66 164
									-109 185 -174 9 -29 21 -54 26 -55 13 -2 28 115 29 214 0 66 -4 85 -32 142
									-22 43 -51 83 -86 114 -32 29 -56 60 -60 78 -24 97 -136 152 -224 108z m127
									-37 c23 -12 66 -74 57 -83 -1 -2 -28 3 -59 9 -44 9 -70 9 -114 0 -31 -6 -58
									-10 -60 -9 -7 8 36 71 57 83 33 18 84 18 119 0z m47 -127 c108 -41 182 -142
									192 -265 7 -91 0 -103 -39 -64 -17 17 -75 56 -128 87 -91 54 -135 91 -173 144
									-12 18 -19 21 -28 13 -9 -9 -9 -17 -1 -31 11 -22 -5 -40 -102 -117 -65 -51
									-81 -79 -87 -151 l-6 -60 -18 59 c-77 249 152 474 390 385z"/>
									<path d="M514 736 c-8 -22 3 -49 19 -43 6 2 12 14 12 27 0 27 -22 39 -31 16z"/>
									<path d="M734 736 c-8 -22 3 -49 19 -43 6 2 12 14 12 27 0 27 -22 39 -31 16z"/>
									<path d="M560 587 c0 -23 31 -37 80 -37 49 0 80 14 80 37 0 12 -6 14 -32 8
									-18 -4 -40 -7 -48 -7 -8 0 -30 3 -47 7 -27 6 -33 4 -33 -8z"/>
									</g>
									</svg>
                                </div>
                                <div class="figures">
                                    <span id="beneficiaryEnrolled"></span>
                                    <label><spring:message code="mst.dashboard.enrolled"></spring:message></label>
                                </div>
                            </div>
                        </div>
                        <div class="single_kpi single_kpi_xl">
                            <div class="kpi_content">
                                <div class="svg_con">
                                    <?xml version="1.0" standalone="no"?>
										<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
										"http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
										<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
										width="128.000000pt" height="128.000000pt" viewBox="0 0 128.000000 128.000000"
										preserveAspectRatio="xMidYMid meet">

										<g transform="translate(0.000000,128.000000) scale(0.100000,-0.100000)"
										fill="#000000" stroke="none">
										<path d="M853 1266 c-62 -20 -126 -60 -161 -101 l-31 -35 -331 0 -330 0 0
										-443 0 -442 123 -123 122 -122 328 0 327 0 0 299 0 299 65 7 c126 13 229 87
										284 204 37 79 37 192 0 271 -33 69 -99 136 -166 167 -65 30 -170 39 -230 19z
										m197 -87 c93 -42 150 -129 150 -229 0 -80 -15 -121 -62 -175 -54 -61 -124 -95
										-198 -95 -186 0 -314 198 -236 365 26 57 103 131 150 144 57 17 148 12 196
										-10z m-433 -143 c-3 -8 -9 -42 -13 -75 l-7 -61 -223 0 -224 0 0 -35 0 -35 235
										0 235 0 20 -40 20 -40 -255 0 -255 0 0 -35 0 -35 285 0 285 0 55 -31 55 -31 0
										-269 0 -269 -265 0 -265 0 0 110 0 110 -110 0 -110 0 0 375 0 375 271 0 c231
										0 270 -2 266 -14z m-387 -856 c0 -27 -1 -50 -3 -50 -1 0 -25 23 -52 50 l-49
										50 52 0 52 0 0 -50z"/>
										<path d="M827 1053 l-27 -27 42 -43 42 -43 -42 -43 -42 -43 27 -27 27 -27 43
										42 43 42 43 -42 43 -42 27 27 27 27 -42 43 -42 43 42 43 42 43 -27 27 -27 27
										-43 -42 -43 -42 -43 42 -43 42 -27 -27z"/>
										<path d="M150 565 l0 -35 300 0 300 0 0 35 0 35 -300 0 -300 0 0 -35z"/>
										<path d="M380 415 l0 -35 185 0 185 0 0 35 0 35 -185 0 -185 0 0 -35z"/>
										<path d="M380 265 l0 -35 185 0 185 0 0 35 0 35 -185 0 -185 0 0 -35z"/>
										</g>
									</svg>
                                </div>
                                <div class="figures">
                                    <span id="FTORejections"></span>
                                    <label><spring:message code="mst.dashboard.ftoRejected"></spring:message></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="kpi_card_center">
                        <div class="single_kpi">
                            <div class="kpi_content">
                                <div class="svg_con">
                                    <?xml version="1.0" standalone="no"?>
                                        <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
                                        "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                        <svg version="1.0" xmlns="http://www.w3.org/2000/svg"
                                        width="300.000000pt" height="400.000000pt" viewBox="0 0 300.000000 400.000000"
                                        preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,400.000000) scale(0.100000,-0.100000)"
                                        fill="#000000" stroke="none">
                                        <path d="M1280 3985 c-197 -39 -415 -180 -522 -338 -49 -72 -101 -213 -118
                                        -317 -18 -114 -8 -441 14 -503 21 -54 11 -77 -31 -77 -21 0 -22 -3 -13 -20 6
                                        -11 20 -20 30 -20 15 0 20 -7 20 -29 0 -73 60 -272 116 -384 95 -190 175 -305
                                        238 -342 14 -8 6 -18 -56 -65 -443 -332 -749 -664 -840 -913 -59 -161 -47
                                        -272 47 -422 49 -80 61 -92 44 -48 -16 42 7 220 43 332 59 187 187 415 336
                                        603 71 89 223 262 261 297 14 13 49 45 76 70 28 26 125 111 218 189 92 78 165
                                        142 161 142 -3 0 -44 -27 -90 -61 l-84 -60 -35 17 c-84 40 -212 203 -274 351
                                        -28 65 -71 230 -71 271 0 32 1 32 48 32 69 0 91 9 108 43 15 28 15 29 -2 22
                                        -73 -32 -148 -8 -158 50 -4 20 -20 69 -36 108 -36 92 -44 153 -30 247 23 160
                                        135 317 313 439 53 36 56 32 27 -30 -25 -56 -27 -166 -4 -215 28 -58 149 -159
                                        258 -215 118 -61 179 -119 196 -186 10 -44 9 -49 -22 -107 -31 -58 -32 -67
                                        -36 -188 -4 -128 -10 -146 -40 -116 -20 20 -65 -22 -79 -73 -15 -56 -16 -173
                                        -2 -223 14 -50 53 -90 81 -83 19 5 20 3 13 -57 -7 -71 12 -171 45 -237 12 -22
                                        52 -70 90 -107 64 -62 69 -71 79 -127 17 -91 15 -217 -2 -251 -27 -54 -28 -54
                                        257 -47 290 7 358 0 441 -45 55 -30 74 -63 30 -55 -28 6 -30 -1 -10 -37 29
                                        -50 22 -55 -45 -32 -8 3 -5 -5 8 -17 53 -52 -6 -95 -68 -51 -27 19 -39 21 -91
                                        15 -56 -7 -61 -6 -66 14 -3 12 -11 21 -18 21 -8 0 -55 -20 -107 -44 -166 -78
                                        -247 -100 -373 -101 -95 0 -122 4 -198 29 -97 32 -130 53 -153 98 -27 52 -44
                                        194 -45 376 0 96 -2 172 -5 170 -13 -14 -46 -260 -47 -358 -2 -135 9 -180 58
                                        -234 l34 -39 -77 -32 c-120 -49 -219 -110 -340 -208 -105 -85 -171 -170 -245
                                        -315 -73 -143 -95 -202 -50 -132 43 66 164 173 267 237 50 31 105 67 122 80
                                        18 13 72 40 120 59 88 36 194 84 329 150 60 29 77 33 116 28 88 -12 280 41
                                        480 132 104 47 130 52 149 29 10 -12 25 -14 71 -9 49 5 63 3 92 -15 45 -28 63
                                        -27 92 5 21 23 25 37 25 90 0 55 3 65 25 82 14 11 25 24 25 28 0 10 -91 70
                                        -160 106 -43 22 -54 23 -265 23 -121 0 -242 -2 -270 -4 -40 -4 -49 -2 -46 10
                                        2 8 6 62 9 121 l5 107 45 -31 c81 -56 114 -51 263 35 25 15 78 33 118 40 52
                                        10 86 24 126 52 105 72 145 136 145 232 l0 57 -34 -71 c-62 -128 -135 -189
                                        -262 -218 -41 -9 -93 -30 -120 -47 -39 -26 -62 -33 -115 -36 -68 -4 -103 7
                                        -158 50 -180 140 -258 272 -269 455 l-5 91 -29 6 c-21 4 -33 15 -43 41 -19 45
                                        -19 166 0 211 12 30 19 35 37 30 13 -3 26 -6 31 -6 4 0 7 -29 7 -65 0 -36 4
                                        -65 9 -65 9 0 14 36 26 201 6 86 35 201 66 261 25 49 90 121 133 147 166 101
                                        456 82 629 -43 73 -51 102 -85 139 -161 45 -90 53 -140 52 -305 0 -161 0 -162
                                        -58 -315 -16 -41 33 30 73 105 44 84 84 206 101 303 15 85 1 160 -47 257 -21
                                        41 -39 78 -41 81 -1 3 18 32 44 65 78 101 97 146 102 249 7 159 -49 312 -155
                                        420 -70 72 -142 109 -261 135 -111 25 -152 25 -201 0 -51 -27 -72 -21 -151 46
                                        -100 85 -143 110 -232 134 -154 41 -245 48 -358 25z m300 -249 c138 -29 324
                                        -130 414 -225 39 -40 51 -40 26 2 -45 73 -21 93 100 85 191 -14 329 -181 330
                                        -399 0 -55 -20 -154 -37 -182 -2 -4 -11 0 -19 8 -75 74 -225 132 -389 150
                                        -101 11 -292 -38 -354 -91 -16 -13 -30 -24 -32 -24 -2 0 -38 33 -79 73 -53 50
                                        -118 97 -210 151 -171 101 -229 157 -253 243 -29 105 -27 109 50 144 154 69
                                        321 93 453 65z"/>
                                        <path d="M1310 2821 c0 -6 -19 -20 -42 -32 -34 -17 -54 -20 -105 -16 -35 2
                                        -63 3 -63 1 0 -2 17 -11 38 -21 46 -22 122 -20 159 4 14 10 42 23 61 28 44 13
                                        53 32 15 32 -15 0 -36 3 -45 7 -11 5 -18 4 -18 -3z"/>
                                        <path d="M960 2313 c0 -2 28 -17 63 -34 47 -22 70 -28 96 -24 40 8 121 46 121
                                        58 0 4 -4 6 -9 3 -4 -3 -40 -10 -78 -16 -56 -9 -83 -8 -132 3 -33 8 -61 12
                                        -61 10z"/>
                                        <path d="M1163 2229 c-39 -18 -45 -18 -85 -5 -23 9 -44 14 -45 12 -2 -2 12
                                        -17 32 -35 53 -47 81 -41 139 27 23 26 15 27 -41 1z"/>
                                        <path d="M1649 2173 c43 -73 108 -92 180 -54 l35 19 -72 0 c-68 1 -132 22
                                        -132 44 0 4 -5 8 -10 8 -7 0 -7 -6 -1 -17z"/>
                                        <path d="M2515 2146 c46 -20 174 -163 206 -230 15 -32 31 -83 35 -112 12 -103
                                        -40 -372 -97 -493 -78 -169 -283 -407 -447 -519 -213 -146 -490 -264 -857
                                        -366 -125 -35 -356 -109 -720 -231 -341 -114 -391 -125 -451 -100 -97 40 -145
                                        120 -154 255 -6 94 -6 95 -15 45 -5 -27 -9 -103 -10 -167 0 -116 0 -117 29
                                        -147 16 -17 55 -40 85 -52 129 -48 264 -34 651 67 135 35 364 89 510 119 451
                                        95 506 113 781 249 416 207 586 361 787 711 105 185 143 330 144 552 0 140 -1
                                        155 -24 205 -54 115 -152 175 -341 208 -138 23 -153 24 -112 6z"/>
                                        <path d="M2082 2025 c48 -44 96 -47 151 -9 45 30 44 37 -4 24 -50 -15 -122
                                        -12 -145 5 -37 28 -39 14 -2 -20z"/>
                                        <path d="M1770 1820 c20 -39 52 -70 71 -70 20 0 89 30 89 39 0 3 -24 5 -53 3
                                        -47 -3 -58 0 -87 24 -33 28 -33 28 -20 4z"/>
                                        </g>
                                        </svg>

                                </div>
                                <div class="figures">
                                    <span id="benefitedBeneficiary"></span>
                                    <label><spring:message code="mst.dashboard.benefited"></spring:message></label>
                                    <span id="beneficiaryPayment"></span>
                                    <label><spring:message code="mst.dashboard.fundDisbursed"></spring:message></label>
                                </div>
                            </div>
                        </div>
						<div class="kpi_card_links">
							<p>
								<a href="${pageContext.request.contextPath}/dashboard/getChartPage/${roleLevel}/${levelId}"><spring:message code="mst.dashboard.analyticalDash"></spring:message></a>
							</p>
						</div>
                    </div>
                    <div class="kpi_card_right">
                        <div class="single_kpi single_kpi_xl">
                            <div class="kpi_content">
                                <div class="svg_con">
									<?xml version="1.0" standalone="no"?>
									<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
									"http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
									<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
									width="128.000000pt" height="128.000000pt" viewBox="0 0 128.000000 128.000000"
									preserveAspectRatio="xMidYMid meet">

									<g transform="translate(0.000000,128.000000) scale(0.100000,-0.100000)"
									fill="#000000" stroke="none">
									<path d="M71 1102 c-70 -38 -71 -42 -71 -462 0 -420 1 -424 71 -462 31 -17 70
									-18 569 -18 499 0 538 1 569 18 70 38 71 42 71 462 0 420 -1 424 -71 462 -31
									17 -70 18 -569 18 -499 0 -538 -1 -569 -18z m1131 -60 l23 -23 0 -379 0 -379
									-23 -23 -23 -23 -539 0 -539 0 -23 23 -23 23 -3 367 c-2 394 -1 404 48 429 19
									10 142 12 552 10 l527 -2 23 -23z"/>
									<path d="M345 891 c-106 -49 -98 -202 13 -241 157 -54 246 182 92 244 -50 20
									-56 20 -105 -3z m110 -66 c31 -30 32 -66 2 -101 -17 -20 -33 -27 -57 -27 -39
									0 -80 40 -80 79 0 35 42 74 80 74 19 0 40 -9 55 -25z"/>
									<path d="M752 828 c3 -23 3 -23 183 -23 173 0 180 1 180 20 0 19 -8 20 -183
									23 l-183 2 3 -22z"/>
									<path d="M757 634 c-4 -4 -7 -16 -7 -26 0 -17 10 -18 183 -16 174 3 182 4 182
									23 0 19 -8 20 -176 23 -96 1 -178 -1 -182 -4z"/>
									<path d="M256 580 c-59 -19 -96 -73 -96 -143 0 -46 14 -69 36 -60 9 3 14 20
									14 45 0 44 21 93 45 102 22 8 268 8 290 0 24 -9 45 -58 45 -102 0 -42 18 -60
									39 -39 18 18 13 99 -9 134 -36 60 -60 68 -205 70 -71 1 -143 -2 -159 -7z"/>
									<path d="M763 423 c-18 -7 -16 -40 3 -47 9 -3 87 -6 174 -6 128 0 160 3 170
									15 10 12 10 18 0 30 -10 12 -42 15 -174 14 -88 0 -167 -3 -173 -6z"/>
									</g>
									</svg>
                                </div>
                                <div class="figures">
                                    <span id="aadhar"></span>
                                    <label><spring:message code="mst.dashboard.adharBenif"></spring:message></label>
                                </div>
                            </div>
                        </div>
                        <div class="single_kpi single_kpi_xl">
                            <div class="kpi_content">
                                <div class="svg_con">
                                    <?xml version="1.0" standalone="no"?>
										<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
										"http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
										<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
										width="128.000000pt" height="128.000000pt" viewBox="0 0 128.000000 128.000000"
										preserveAspectRatio="xMidYMid meet">

										<g transform="translate(0.000000,128.000000) scale(0.100000,-0.100000)"
										fill="#000000" stroke="none">
										<path d="M91 1226 c-49 -27 -50 -39 -51 -384 0 -351 2 -366 55 -390 15 -7 70
										-12 128 -12 l102 0 0 -82 c1 -99 25 -158 93 -226 65 -65 120 -87 222 -87 102
										0 157 22 222 87 68 68 92 127 93 226 l0 82 102 0 c58 0 113 5 128 12 53 24 55
										40 55 388 0 348 -2 364 -55 388 -40 18 -1061 16 -1094 -2z m1089 -46 c19 -19
										20 -33 20 -340 0 -391 13 -360 -152 -360 l-113 0 -27 50 c-73 131 -260 186
										-403 119 -58 -27 -125 -91 -146 -137 l-14 -32 -112 0 c-166 0 -153 -31 -153
										360 0 307 1 321 20 340 19 19 33 20 540 20 507 0 521 -1 540 -20z m-450 -556
										c75 -22 149 -98 174 -178 88 -280 -253 -487 -461 -280 -111 111 -111 277 2
										389 78 79 174 102 285 69z"/>
										<path d="M220 1100 c-16 -16 -20 -33 -20 -80 0 -90 14 -100 140 -100 126 0
										140 10 140 100 0 90 -14 100 -140 100 -87 0 -103 -3 -120 -20z m60 -40 c0 -13
										-7 -20 -20 -20 -19 0 -27 20 -13 33 13 14 33 6 33 -13z m80 -40 c0 -53 -2 -60
										-20 -60 -18 0 -20 7 -20 60 0 53 2 60 20 60 18 0 20 -7 20 -60z m78 37 c2 -12
										-3 -17 -17 -17 -15 0 -21 6 -21 21 0 25 33 22 38 -4z m-158 -78 c0 -14 -5 -19
										-17 -17 -26 5 -29 38 -4 38 15 0 21 -6 21 -21z m158 4 c-5 -26 -38 -29 -38 -4
										0 15 6 21 21 21 14 0 19 -5 17 -17z"/>
										<path d="M204 827 c-3 -8 -4 -34 -2 -58 l3 -44 75 0 75 0 0 55 0 55 -73 3
										c-55 2 -74 0 -78 -11z m116 -47 c0 -17 -7 -20 -40 -20 -33 0 -40 3 -40 20 0
										17 7 20 40 20 33 0 40 -3 40 -20z"/>
										<path d="M444 827 c-3 -8 -4 -34 -2 -58 l3 -44 75 0 75 0 0 55 0 55 -73 3
										c-55 2 -74 0 -78 -11z m116 -47 c0 -17 -7 -20 -40 -20 -33 0 -40 3 -40 20 0
										17 7 20 40 20 33 0 40 -3 40 -20z"/>
										<path d="M684 827 c-3 -8 -4 -34 -2 -58 l3 -44 75 0 75 0 0 55 0 55 -73 3
										c-55 2 -74 0 -78 -11z m116 -47 c0 -17 -7 -20 -40 -20 -33 0 -40 3 -40 20 0
										17 7 20 40 20 33 0 40 -3 40 -20z"/>
										<path d="M924 827 c-3 -8 -4 -34 -2 -58 l3 -44 75 0 75 0 0 55 0 55 -73 3
										c-55 2 -74 0 -78 -11z m116 -47 c0 -17 -7 -20 -40 -20 -33 0 -40 3 -40 20 0
										17 7 20 40 20 33 0 40 -3 40 -20z"/>
										<path d="M497 502 c-15 -15 -27 -34 -27 -42 0 -8 19 -34 42 -57 l42 -43 -42
										-43 c-23 -23 -42 -50 -42 -58 0 -19 51 -69 70 -69 8 0 34 19 57 42 l43 42 43
										-42 c23 -23 50 -42 58 -42 19 0 69 51 69 70 0 8 -19 34 -42 57 l-42 43 42 43
										c23 23 42 49 42 57 0 19 -50 70 -69 70 -8 0 -35 -19 -58 -42 l-43 -42 -43 42
										c-23 23 -50 42 -58 42 -8 0 -27 -13 -42 -28z m88 -62 c21 -22 46 -40 54 -40 8
										0 35 19 58 42 34 33 46 39 55 30 9 -9 3 -21 -30 -55 -23 -23 -42 -49 -42 -57
										0 -8 19 -34 42 -57 33 -34 39 -46 30 -55 -9 -9 -21 -3 -55 30 -23 23 -49 42
										-57 42 -8 0 -34 -19 -57 -42 -34 -33 -46 -39 -55 -30 -9 9 -3 21 30 55 23 23
										42 49 42 57 0 8 -19 33 -41 56 -23 23 -38 47 -35 53 11 17 20 13 61 -29z"/>
										</g>
										</svg>
                                </div>
                                <div class="figures">
                                    <span id="nonAadhar"></span>
                                    <label><spring:message code="mst.dashboard.nonAdharBenif"></spring:message></label>
                                </div>
                            </div>
                        </div>
                    </div>
                        
                </div>

			</div>
		</div>
	</div>
	</c:if>
	</div>
<script>
$(document).ready(function() {
	var roleLevel='${roleLevel}';
	var levelId='${levelId}';
	getDashboardCardDetails(roleLevel,levelId);
});
function getDashboardCardDetails(roleLevel,levelId)
{
	$.ajax({
		type : "GET",
		url : '${contextPath}/dashboard/kpiDetails',
		dataType : "json",
		data : {
			"roleLevel" : roleLevel,
			"levelId" : levelId,
			},
		success : function(response) {
			var html = "";
			var data = response.data;
			if (data != undefined) {
					$("#beneficiaryEnrolled").html(data.totalBeneficiaryEnrolled);
					$("#beneficiaryPayment").html(data.totalBeneficiaryPayment);
					$("#benefitedBeneficiary").html(data.noOfBeneficiaryBenefited);
					$("#aadhar").html(data.noOfBeneficiaryWithAadhar);
					$("#nonAadhar").html(data.noOfBeneficiaryWithNonAadhar);
					$("#FTORejections").html(data.totalFTORejections);
				} 
			},
		error : function(error) {
// 			bootbox.alert("<spring:message code="mst.dashboard.wentWrong"></spring:message>.");
		}
	});
}

</script>
	