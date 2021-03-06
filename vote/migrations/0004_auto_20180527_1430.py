# Generated by Django 2.0.3 on 2018-05-27 13:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vote', '0003_auto_20180527_1258'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='candidates',
            options={},
        ),
        migrations.AlterModelManagers(
            name='candidates',
            managers=[
            ],
        ),
        migrations.RemoveField(
            model_name='candidates',
            name='voters_ptr',
        ),
        migrations.AddField(
            model_name='candidates',
            name='date_of_birth',
            field=models.DateField(default='11-04-1992'),
        ),
        migrations.AddField(
            model_name='candidates',
            name='id',
            field=models.AutoField(auto_created=True, default=0, primary_key=True, serialize=False, verbose_name='ID'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='candidates',
            name='name',
            field=models.CharField(default=None, max_length=20),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='candidates',
            name='surname',
            field=models.CharField(default=None, max_length=25),
            preserve_default=False,
        ),
    ]
