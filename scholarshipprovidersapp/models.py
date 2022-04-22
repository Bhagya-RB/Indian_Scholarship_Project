from email.policy import default
from django.db import models

# Create your models here.
class ProviderRegistrationModel(models.Model):
    provider_id =models.AutoField(primary_key=True)
    institute_name = models.CharField(max_length=155)
    board_university = models.CharField(max_length=155)
    pan_number = models.CharField(max_length=111)
    hod_institute =models.CharField(max_length =111)
    phone_number = models.BigIntegerField(null=True)
    email = models.EmailField(max_length=100,help_text="Enter Email")
    password = models.CharField(max_length=100,help_text="Enter Password")
    firm_registration =models.ImageField(default=False)
    photo = models.ImageField(default=False)
    status = models.CharField(default='pending',max_length=100, null=True)
    reg_date = models.DateField(auto_now_add=True, null=True)

    class Meta:
        db_table = 'Scholarship_Provider_Details'

class PostScholarshipModel(models.Model):
    post_id = models.AutoField(primary_key=True)
    type_of_scholarship = models.CharField(max_length=155)
    type_of_scheme = models.CharField(max_length=100, null=True)
    name_of_scholarship = models.CharField(max_length=111)
    amount = models.IntegerField(null=True)
    eligibility = models.CharField(max_length=55)
    description = models.TextField(max_length=155)
    documents_required = models.CharField(max_length=100, null=True)
    last_date = models.DateField(null=True)
    status = models.CharField(default='pending',max_length=100, null=True)
    post_date = models.DateField(auto_now_add=True, null=True)

    class Meta:
        db_table = 'Post_Scholarship_Details'



    


  