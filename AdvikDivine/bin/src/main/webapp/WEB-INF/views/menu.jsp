<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<sec:authentication var="principal" property="principal" />
<!-- Sidebar -->
		<div class="sidebar sidebar-style-2">
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">
					<ul class="nav nav-primary">
						<sec:authorize access="isAuthenticated()">
							<c:forEach items="${sessionScope.USER_MENUS}" var="node">
								<c:if test="${node.isDisplay eq true}">
									<li class="nav-item">
										<c:choose>
											<c:when test="${node.isParent eq true}">
												<a data-toggle="collapse" href="#mnu${node.menuId}">
													<i class="${node.menuIcon}"></i>
													<p>${node.menuText}</p>
													<span class="caret"></span>
												</a>
												<div class="collapse" id="mnu${node.menuId}">
													<ul class="nav nav-collapse">
														<c:forEach items="${node.children}" var="menu">
															<c:set var="node" value="${menu}" scope="request" />
															<jsp:include page="node.jsp" />
														</c:forEach>
													</ul>
												</div>
											</c:when>
											<c:when test="${node.isParent eq false}">
												<a href="${contextPath}${node.menuURL}">
													<i class="${node.menuIcon}"></i>
													<p>${node.menuText}</p>
												</a>
											</c:when>
										</c:choose>
									</li>
								</c:if>
							</c:forEach>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>