# Generated by Django 4.0.4 on 2022-04-15 06:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scholarshipprovidersapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='providerregistration',
            name='pan_number',
            field=models.IntegerField(),
        ),
        migrations.AlterModelTable(
            name='providerregistration',
            table='Scholarship_Provider_Details',
        ),
    ]