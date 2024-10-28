from flask import render_template

class FaqController:

    def index():
        data = {}

        return render_template('faq.html', data=data)