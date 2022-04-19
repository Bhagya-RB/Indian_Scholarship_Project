from django.db import models

# Create your models here.
class StudentsRegistrationModel(models.Model):
    student_id=models.AutoField(primary_key=True)
    name = models.CharField(max_length=155)
    phone_number = models.BigIntegerField(null=True)
    email = models.EmailField(max_length=100,help_text="Enter Email")
    password = models.CharField(max_length=100,help_text="Enter Password")
    photo = models.ImageField(default=False)
    status = models.CharField(default='pending',max_length=100, null=True)
    reg_date = models.DateField(auto_now_add=True, null=True)

    class Meta:
        db_table = "Student_Details"

# Create students Feedback model
class FeedbackModel(models.Model):
    feedback_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=20, null=True)
    email=models.EmailField(max_length=45, null=True)
    message=models.TextField(max_length=1000)
    feedback_date = models.DateField(auto_now_add=True, null=True)

    class Meta:
       db_table = 'Students_Feedback_Details'
