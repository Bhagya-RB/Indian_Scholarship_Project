from email import message
from django.shortcuts import render

# Create your views here.
from django.shortcuts import render,redirect, get_object_or_404
from scholarshipprovidersapp.models import ProviderRegistrationModel ,PostScholarshipModel
from django.contrib import messages

from studentsapp.models import FeedbackModel


# Create your views here.
def scholarship_provider_index(request):
    return render(request,"scholarshipproviders/provider-index.html")



def scholarship_provider_registration(request):
    if request.method == "POST":
        institute_name =request.POST['institutename']
        board_university = request.POST['boarduniversity']
        pan_number = request.POST['pan']
        hod_institute = request.POST['hod']
        phone_number = request.POST['phone']
        email = request.POST['email']
        password = request.POST['password']
        firm_registration = request.FILES['firmregimage']
        photo= request.FILES['image']
        ProviderRegistrationModel.objects.create(institute_name=institute_name, board_university=board_university, pan_number=pan_number, hod_institute=hod_institute,phone_number=phone_number,email=email, password=password, firm_registration=firm_registration, photo=photo)
    return render(request,"scholarshipproviders/scholarship-provider-registration.html")



def scholarship_provider_login(request):
    if request.method=="POST":
        email=request.POST.get("email")
        print(email)
        password=request.POST.get("password")      
        print(password) 
        try:
            check=ProviderRegistrationModel.objects.get(email=email,password=password)
            request.session["provider_id"]=check.provider_id
            status=check.status
            if status=="Accepted":
                messages.success(request,'Login Successful')
                return redirect('provider-index')
            elif status=="Rejected":
                messages.error(request,'Your Request has been Rejected, So you cannot Login')  
            elif status=="Pending":
                messages.info(request,'Your Status is Pending, You Cannot Login Now')  
        except:
             messages.warning(request,'Invalid Login') 
    return render(request,"scholarshipproviders/scholarship-provider-login.html")



def scholarship_provider_profile(request):
    provider_id =request.session["provider_id"]
    profile = ProviderRegistrationModel.objects.get(provider_id=provider_id) 
    obj=get_object_or_404(ProviderRegistrationModel,provider_id=provider_id)
    if request.method == 'POST':
        hod_institute= request.POST.get('hodinstitute')
        email=request.POST.get('email')
        password=request.POST.get('password')
        phone_number = request.POST.get('phonenumber')
        if len(request.FILES) != 0:
            photo = request.FILES['photo']
            obj.hod_institute =hod_institute
            obj.email=email
            obj.password=password
            obj.phone_number = phone_number
            obj.photo = photo
            obj.save(update_fields=['hod_institute','photo','email','phone','password'])
        else:
            obj.hod_institute =hod_institute
            obj.email=email
            obj.password=password
            obj.phone_number=phone_number
            obj.save(update_fields=['hod_institute','email','phone_number','password'])
    return render(request, "scholarshipproviders/provider-profile.html",{"profile":profile})


def provider_post_scholarship(request):
    PostScholarshipModeldisplay = PostScholarshipModel.objects.all()
    if request.method == "POST":
        type_of_scholarship =request.POST['typeofscholarship']
        type_of_scheme = request.POST['typeofscheme']
        name_of_scholarship = request.POST['nameofscholarship']
        amount = request.POST['amount']
        eligibility = request.POST['eligibility']
        description = request.POST['description']
        documents_required = request.POST['document']
        last_date = request.POST['date']
        PostScholarshipModel.objects.create(type_of_scholarship=type_of_scholarship, type_of_scheme=type_of_scheme, name_of_scholarship=name_of_scholarship, amount=amount, eligibility=eligibility, description=description, documents_required=documents_required, last_date=last_date)
    return render(request,"scholarshipproviders/provider-post-scholarship.html",{"PostScholarshipModel":PostScholarshipModeldisplay})

def provider_view_scholarship(request):
    data =  PostScholarshipModel.objects.all()
    return render(request,"scholarshipproviders/provider-view-scholarship.html",{"data": data})

def provider_edit_scholarship(request,id):
    print("hello")
    edit = PostScholarshipModel.objects.filter(post_id=id)
    print(edit)
    obj = get_object_or_404(PostScholarshipModel, post_id=id)
    if request.method == 'POST':
        type_of_scholarship =request.POST.get('typeofscholarship')
        type_of_scheme = request.POST.get('typeofscheme')
        name_of_scholarship = request.POST.get('nameofscholarship')
        amount = request.POST.get('amount')
        eligibility = request.POST.get('eligibility')
        description = request.POST.get('description')
        documents_required = request.POST.get('document')
        last_date = request.POST.get('date')

        obj.type_of_scholarship = type_of_scholarship
        obj.type_of_scheme = type_of_scheme
        obj.name_of_scholarship = name_of_scholarship
        obj.amount = amount
        obj.eligibility = eligibility
        obj.description = description
        obj.documents_required = documents_required
        obj.last_date = last_date

        obj.save(update_fields=['type_of_scholarship', 'type_of_scheme', 'name_of_scholarship', 'amount', 'eligibility', 'description', 'documents_required', 'last_date'])

        if obj.save():
            messages.success(request,"Scholarship Updated Successfully...")
        else:
            messages.error(request,"Something went wrong")
    return render(request,"scholarshipproviders/provider-edit-scholarship.html",{'edit':edit})



def provider_view_applied_candidates(request):
    return  render(request, "scholarshipproviders/provider-view-applied-candidates.html")

def provider_view_applied_candidates_details(request):
    return render(request,"scholarshipproviders/provider-view-applied-details.html")

def provider_view_feedback(request):
    FeedbackModeldisplay =FeedbackModel.objects.all()
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        feedback = request.POST.get('feedback')
        FeedbackModel.objects.create(name=name, email=email, feedback=feedback)
    return render(request,"scholarshipproviders/provider-view-feedback.html",{"FeedbackModel":FeedbackModeldisplay})

