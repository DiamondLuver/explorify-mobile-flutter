from rest_framework import serializers
#from .models import CompanyProfile
from .models import *


class CompanyProfileSerializer(serializers.ModelSerializer):
    
    class Meta: 
        model = CompanyProfile
        fields = ('company_id','company_name','description','location','head_office','employee_size','company_type','specialization','company_website','company_pic')  
        company_id = serializers.IntegerField(required=False)



class InternshipPostSerialzer(serializers.ModelSerializer):
    class Meta: 
        model = InternshipPost
        fields =('internship_post_id','job_title','category','company_name','location','job_description','job_requirement','salary','job_type','job_duration','qualification','status')
        internship_post_id = serializers.IntegerField(required=False)


