# Generated by Django 4.0.4 on 2022-05-02 01:38

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='info',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField(max_length=20)),
                ('st_id', models.CharField(max_length=20)),
                ('level', models.IntegerField()),
                ('gpa', models.IntegerField()),
            ],
        ),
    ]
