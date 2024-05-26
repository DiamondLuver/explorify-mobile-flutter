from django.contrib import admin
from internship.models import CompanyProfile, Document, InternshipApplication, InternshipPost, JobPoster
# CompanyProfile | Document | InternshipApplication | InternshipPost | JobPoster

admin.site.register(CompanyProfile)
admin.site.register(Document)
admin.site.register(InternshipApplication)
admin.site.register(InternshipPost)
admin.site.register(JobPoster)