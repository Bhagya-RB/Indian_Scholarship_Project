from django.shortcuts import get_object_or_404, render, redirect

from scholarshipprovidersapp.models import PostScholarshipModel, ProviderRegistrationModel
from studentsapp.models import ApplicationModel, StudentsRegistrationModel, FeedbackModel

# Create your views here.
def admin_index(request):
    providers_count = ProviderRegistrationModel.objects.count()
    scholarship_count = PostScholarshipModel.objects.count()
    candidates_count =StudentsRegistrationModel.objects.count()
    feedback_count = FeedbackModel.objects.count()
    return render(request,"admin/admin-index.html",{"providers_count":providers_count,"scholarship_count":scholarship_count,"candidates_count":candidates_count,"feedback_count":feedback_count})

def admin_login(request):
    if request.method == "POST":
        name = request.POST.get('name')
        password = request.POST.get('password')
        if name == 'admin' and password == 'admin' :
            # messages.success(request, "login successfully")
            return redirect('admin-index')
        else:
            pass
            # messages.error(request,"invalid login")
    return render(request,"admin/admin-login.html")

def admin_view_scholarship_provider(request):
    ProviderRegistrationModeldisplay = ProviderRegistrationModel.objects.all()
    return render(request,"admin/admin-view-provider.html",{"ProviderRegistrationModel":ProviderRegistrationModeldisplay})

def accepts_provider(request, id):
    accept = get_object_or_404(ProviderRegistrationModel, provider_id=id)
    accept.status = "Accepted"
    accept.save(update_fields=['status'])
    accept.save()
    return redirect('admin-view-provider')

def reject_provider(request, id):
    reject = get_object_or_404(ProviderRegistrationModel,provider_id=id)
    reject.status = "Rejected"
    reject.save(update_fields=['status'])
    reject.save()
    return redirect('admin-view-provider')



def admin_view_scholarships(request):
    PostScholarshipModeldisplay = PostScholarshipModel.objects.all()
    return render(request,"admin/admin-view-scholarships.html",{"PostScholarshipModel":PostScholarshipModeldisplay})

def accepts_scholarship(request, id):
    accept = get_object_or_404(PostScholarshipModel, post_id=id)
    accept.status = "Accepted"
    accept.save(update_fields=['status'])
    accept.save()
    return redirect('admin-view-scholarship')

def reject_scholarship(request, id):
    reject = get_object_or_404(PostScholarshipModel, post_id=id)
    reject.status = "Rejected"
    reject.save(update_fields=['status'])
    reject.save()
    return redirect('admin-view-scholarship')



def admin_view_applied_candidates(request):
    return render(request,"admin/admin-view-applied-candidates.html")


def admin_view_all_candidates(request):
    StudentsRegistrationModeldisplay = StudentsRegistrationModel.objects.all()
    return render(request,"admin/admin-view-all-candidates.html",{"StudentsRegistrationModel":StudentsRegistrationModeldisplay})

def accepts_students(request, id):
    accept = get_object_or_404(StudentsRegistrationModel, student_id=id)
    accept.status = "Accepted"
    accept.save(update_fields=['status'])
    accept.save()
    return redirect('admin-view-all-candidates')

def reject_students(request, id):
    reject = get_object_or_404(StudentsRegistrationModel, student_id=id)
    reject.status = "Rejected"
    reject.save(update_fields=['status'])
    reject.save()
    return redirect('admin-view-all-candidates')

def accepts_student(request, id):
    accept = get_object_or_404(StudentsRegistrationModel, provider_id=id)
    accept.status = "Accepted"
    accept.save(update_fields=['status'])
    accept.save()
    return redirect('admin-view-applied-candidates')

def reject_student(request, id):
    reject = get_object_or_404(StudentsRegistrationModel,provider_id=id)
    reject.status = "Rejected"
    reject.save(update_fields=['status'])
    reject.save()
    return redirect('admin-view-applied-candidates')



def admin_view_feedback(request):
    data = FeedbackModel.objects.all()
    return render(request,"admin/admin-view-feedback.html",{"data":data})


