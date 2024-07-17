from django.contrib import admin
from internship.models import CompanyProfile, Document, InternshipApplication, InternshipPost
# CompanyProfile | Document | InternshipApplication | InternshipPost | JobPoster

admin.site.register(CompanyProfile)
admin.site.register(Document)
admin.site.register(InternshipApplication)
admin.site.register(InternshipPost)


