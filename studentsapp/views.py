from django.http import HttpResponse
from django.shortcuts import render, redirect ,get_object_or_404
from django.contrib import messages
from studentsapp.models import StudentsRegistrationModel

# Create your views here.
def student_index(request):
    return render(request,"students/student-home.html")

def student_registration(request):
    if request.method == "POST" and request.FILES["photo"]:
        name = request.POST['name']
        phone_number = request.POST['phone']
        email = request.POST['email']
        password = request.POST['password']
        photo = request.FILES['photo']
        StudentsRegistrationModel.objects.create(name=name, phone_number=phone_number, email=email, password=password, photo=photo)
    return render(request,"students/student-registration.html")

def student_login(request):
    if request.method=="POST":
        email=request.POST.get("email")
        print(email)
        password=request.POST.get("password")      
        print(password) 
        try:
            check=StudentsRegistrationModel.objects.get(email=email,password=password)
            request.session["student_id"]=check.student_id
            status=check.status
            if status=="Accepted":
                messages.success(request,'Login Successful')
                return redirect('student-home')
            elif status=="Rejected":
                messages.error(request,'Your Request has been Rejected, So you cannot Login')  
            elif status=="Pending":
                messages.info(request,'Your Status is Pending, You Cannot Login Now')  
        except:
             messages.warning(request,'Invalid Login') 
    return render(request, "students/student-login.html")

def student_profile(request):
    
    return render(request,"students/student-profile.html")

def student_courses(request):
    return render(request,"students/courses.html")

def student_applied_scholarships(request):
    return render(request,"students/student-applied-scholarships.html")

def student_view_scholarship(request):
    return render(request,"students/student-view-scholarships.html")

def student_scholarship_details(request):
    return render(request,"students/student-scholarship-details.html")

def student_feedback(request):
    return render(request,"students/student-feedback.html")