from django.shortcuts import render

# Create your views here.
from urllib import request
from django.shortcuts import redirect, render
# import requests
import random

from mainapp.models import ContactModel



# Create your views here.
def home(request):
    return render(request,"main/index.html")

def about(request):
    return render(request,"main/about.html")

def scholarships(request):
    return render(request,"main/scholarships.html")

def contact(request):
    if request.method  == "POST":
        name = request.POST ['name']
        email = request.POST ['email']
        subject = request.POST ['subject']
        message = request.POST ['message']
        ContactModel.objects.create(name=name, email=email, subject=subject, message=message)

    return render(request,"main/contact.html")

# def testsms(request):
#      if request.method == "POST":
#         otp=random.randint(1111,9999)
#         mobile =request.POST.get("mobile")      
#         url = "https://www.fast2sms.com/dev/bulkV2"
#         my_data = {
#             'sender_id': 'FSTSMS',            
#             'message': 'successfully registered your opt is '+ str(otp),            
#             'language': 'english',
#             'route': 'p',            
#             'numbers': mobile   
#         }
#         # create a dictionary
#         headers = {
#             'authorization': 'ZsOg6Werl5NpTEQtuzxcKM8IVRwbyAnfqDFaUjoCS9Pd4kiB7XflpuKAOLXnyPkhDoYmUMzax67Tr19g',
#             'Content-Type': "application/x-www-form-urlencoded",
#             'Cache-Control': "no-cache"
#         }
#         # make a post request
#         response = requests.request("POST",
#                                     url,
#                                     data = my_data,
#                                     headers = headers)
#         # print the send message
#         print(response.text)  
#      return render(request,"main/msg.html")

  
