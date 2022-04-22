"""scholarshipproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as main_views
from adminapp import views as admin_views
from scholarshipprovidersapp import views as providers_views
from studentsapp import views as students_views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',main_views.home, name='home'),
    path('about',main_views.about, name='about'),
    path('scholarships',main_views.scholarships, name='scholarships'),
    path('contact',main_views.contact, name='contact'),
    # path('msg',main_views.testsms, name='msg'),
    # path('sms',main_views.sms,name='sms'),


    # admin path
    path('admin-index',admin_views.admin_index, name='admin-index'),
    path ('admin-login',admin_views.admin_login, name='admin-login'),
    path('admin-view-provider',admin_views.admin_view_scholarship_provider, name='admin-view-provider'),

    # accept reject provider urls
     path('accepts_provider/<int:id>/',admin_views.accepts_provider, name='accepts_provider'),
     path('reject_provider/<int:id>/',admin_views.reject_provider, name='reject_provider'),


    path('admin-view-scholarship',admin_views.admin_view_scholarships, name='admin-view-scholarship'),


    path('accepts_scholarship/<int:id>/',admin_views.accepts_scholarship, name='accepts_scholarship'),
    path('reject_scholarship/<int:id>/',admin_views.reject_scholarship, name='reject_scholarship'),


    path('admin-view-applied-candidates',admin_views.admin_view_applied_candidates, name='admin-view-applied-candidates'),



    path('admin-view-all-candidates',admin_views.admin_view_all_candidates, name='admin-view-all-candidates'),

    #accept reject students urls
    path('accepts_students/<int:id>/',admin_views.accepts_students, name='accepts_students'),
    path('reject_students/<int:id>/',admin_views.reject_students, name='reject_students'),


    path('admin-view-feedback',admin_views.admin_view_feedback, name='admin-view-feedback'),


    # scholarship provider path
    path('provider-index',providers_views.scholarship_provider_index, name='provider-index'),
    path('scholarship-provider-registration',providers_views.scholarship_provider_registration, name='scholarship-provider-registration'),
    path('scholarship-provider-login',providers_views.scholarship_provider_login, name='scholarship-provider-login'),

    path('provider_profile',providers_views.scholarship_provider_profile, name='provider_profile'),

    path('provider-post-scholarship',providers_views.provider_post_scholarship,name='provider-post-scholarship'),
    path('provider-view-scholarship',providers_views.provider_view_scholarship, name='provider-view-scholarship'),

    path('provider-edit-scholarship',providers_views.provider_edit_scholarship, name='provider-edit-scholarship'),
    path('provider-edit-scholarship/<int:id>/',providers_views.provider_edit_scholarship, name='provider-edit-scholarship'),



    
    path('provider-view-applied-candidates',providers_views.provider_view_applied_candidates, name='provider-view-applied-candidates'),
    path('provider-view-applied-details',providers_views.provider_view_applied_candidates_details, name='provider-view-applied-details'),
    path('provider-view-feedback',providers_views.provider_view_feedback,name='provider-view-feedback'),

    # students path
    path('student-home',students_views.student_index, name='student-home'),
    path('student-registration',students_views.student_registration, name='student-registration'),
    path('student-login',students_views.student_login, name='student-login'),
    path('student-profile',students_views.student_profile, name='student-profile'),
    path('student-courses',students_views.student_courses, name='student-courses'),

    path('student-applied-scholarships',students_views.student_applied_scholarships, name='student-applied-scholarships'),


    path('student-applied-scholarships/<int:id>/',students_views.student_applied_scholarships, name='student-applied-scholarships'),
    path('student-view-scholarship',students_views.student_view_scholarship, name='student-view-scholarship'),
    path('student-scholarship-details',students_views.student_scholarship_details, name='student-scholarship-details'),

    path('student-scholarship-details/<int:id>/',students_views.student_scholarship_details, name='student-scholarship-details'),

    # path('apply-now/<int:id>/',students_views.apply_now, name='apply-now'),


    path('student-application-form/<int:id>/',students_views.student_application_form, name='student-application-form'),


    path('student-feedback',students_views.student_feedback, name='student-feedback'),


]

urlpatterns+= static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
