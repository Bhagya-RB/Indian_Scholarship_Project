# Generated by Django 4.0.4 on 2022-04-22 05:16

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ApplicationModel',
            fields=[
                ('application_id', models.AutoField(primary_key=True, serialize=False)),
                ('type_of_scholarship', models.CharField(max_length=155)),
                ('type_of_scheme', models.CharField(max_length=100, null=True)),
                ('name_of_scholarship', models.CharField(max_length=111)),
                ('amount', models.IntegerField(null=True)),
                ('last_date', models.DateField(auto_now_add=True, null=True)),
                ('eligibility', models.CharField(max_length=111)),
                ('application_date', models.DateField(auto_now_add=True, null=True)),
            ],
            options={
                'db_table': 'Application_Details',
            },
        ),
        migrations.CreateModel(
            name='FeedbackModel',
            fields=[
                ('feedback_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=20, null=True)),
                ('email', models.EmailField(max_length=45, null=True)),
                ('message', models.TextField(max_length=1000)),
                ('feedback_date', models.DateField(auto_now_add=True, null=True)),
            ],
            options={
                'db_table': 'Students_Feedback_Details',
            },
        ),
        migrations.CreateModel(
            name='StudentsRegistrationModel',
            fields=[
                ('student_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=155)),
                ('phone_number', models.BigIntegerField(null=True)),
                ('email', models.EmailField(help_text='Enter Email', max_length=100)),
                ('password', models.CharField(help_text='Enter Password', max_length=100)),
                ('photo', models.ImageField(default=False, upload_to='')),
                ('status', models.CharField(default='pending', max_length=100, null=True)),
                ('reg_date', models.DateField(auto_now_add=True, null=True)),
            ],
            options={
                'db_table': 'Student_Details',
            },
        ),
    ]
