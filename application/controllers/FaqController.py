from flask import render_template

from application.models.FaqModel import getFaqs

class FaqController:

    def index():
        data = {}

        data["faqs"] = getFaqs()

        return render_template('faq.html', data=data)