# Generated by Django 4.0.4 on 2022-04-15 09:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('scholarshipprovidersapp', '0003_alter_providerregistration_pan_number'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='ProviderRegistration',
            new_name='ProviderRegistrationModel',
        ),
    ]