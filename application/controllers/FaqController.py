from flask import render_template

class FaqController:

    def index():
        data = {}

        faqs = []
        faqs.append(dict(question="What do you do?", answer="Here at travel bluprint we strive to streamline the process of getting a personalized itinerary made for your trip."))
        faqs.append(dict(question="Does it cost anything?", answer="We are currently in an open beta to get the most amount of feedback possible. We plan to move to a more sustainable payment model if we receive positive feedback."))
        faqs.append(dict(question="test1", answer="a"))
        faqs.append(dict(question="test2", answer="b"))
        faqs.append(dict(question="test3", answer="v"))

        data["faqs"] = faqs

        return render_template('faq.html', data=data)