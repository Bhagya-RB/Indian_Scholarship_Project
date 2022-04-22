from django.http import HttpResponse
from django.shortcuts import render, redirect ,get_object_or_404
from django.contrib import messages
from studentsapp.models import StudentsRegistrationModel, ApplicationModel, FeedbackModel
from scholarshipprovidersapp.models import PostScholarshipModel

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
    student_id =request.session["student_id"]
    profile = StudentsRegistrationModel.objects.get(student_id=student_id) 
    obj=get_object_or_404(StudentsRegistrationModel,student_id=student_id)
    if request.method == 'POST':
        name= request.POST.get('name')
        email=request.POST.get('email')
        password=request.POST.get('password')
        phone_number = request.POST.get('phonenumber')
        if len(request.FILES) != 0:
            photo = request.FILES['photo']
            obj.name = name
            obj.email=email
            obj.password=password
            obj.phone_number = phone_number
            obj.photo = photo
            obj.save(update_fields=['name','photo','email','phonenumber','password'])
        else:
            obj.name = name
            obj.email=email
            obj.password=password
            obj.phone_number=phone_number
            obj.save(update_fields=['name','email','phone_number','password'])
    return render(request,"students/student-profile.html",{"profile":profile})

def student_courses(request):
    return render(request,"students/courses.html")

def student_applied_scholarships(request,id):
    obj = get_object_or_404(PostScholarshipModel,post_id=id)
    return render(request,"students/student-applied-scholarships.html",{"data":obj})

def student_view_scholarship(request):
    data =  PostScholarshipModel.objects.all()
    return render(request,"students/student-view-scholarships.html",{"data":data})

def student_scholarship_details(request,id):
    # data = PostScholarshipModel.objects.filter(post_id=id)
    obj = get_object_or_404(PostScholarshipModel,post_id=id)
    return render(request,"students/student-scholarship-details.html",{"data":obj})

# def apply_now(request,id):
#     return render(request,"students/student-application-form.html")

def student_application_form(request,id):
    # student_id= request.session["student_id"]
    # scholarship_details = PostScholarshipModel.objects.get(post_id=id)
    # student_details = StudentsRegistrationModel.objects.all(student_id = student_id)
    obj = get_object_or_404(PostScholarshipModel,post_id=id)
    # objj = get_object_or_404(StudentsRegistrationModel,student_id=id)
    
    if request.method == "POST":
        type_of_scholarship = request.POST['type_of_scholarship']
        name_of_scholarship = request.POST['name_of_scholarship']
        type_of_scheme = request.POST['type_of_scheme']
        amount = request.POST['amount']
        last_date = request.POST['last_date']
        eligibility = request.POST['eligibility']
        # name = request.POST['name']
        # email = request.POST['email']
        # mobile = request.POST['mobile']
        ApplicationModel.objects.create(type_of_scholarship=type_of_scholarship, eligibility=eligibility,name_of_scholarship=name_of_scholarship, type_of_scheme=type_of_scheme, amount=amount, last_date=last_date,)
    return render(request,"students/student-application-form.html",{"data":obj,})

def student_feedback(request):
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        message = request.POST.get('feedback')
        FeedbackModel.objects.create(name=name, email=email, message=message)
    return render(request,"students/student-feedback.html")