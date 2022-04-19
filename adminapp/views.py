from django.shortcuts import get_object_or_404, render, redirect

from scholarshipprovidersapp.models import ProviderRegistrationModel
from studentsapp.models import StudentsRegistrationModel

# Create your views here.
def admin_index(request):
    return render(request,"admin/admin-index.html")

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
    return render(request,"admin/admin-view-scholarships.html")

def admin_view_applied_candidates(request):
    return render(request,"admin/admin-view-applied-candidates.html")

def admin_view_all_candidates(request):
    StudentsRegistrationModeldisplay = StudentsRegistrationModel.objects.all()
    return render(request,"admin/admin-view-all-candidates.html",{"StudentsRegistrationModel":StudentsRegistrationModeldisplay})

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
    return render(request,"admin/admin-view-feedback.html")
