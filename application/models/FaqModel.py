from framework.Database import get_db

def getFaqs():
    # gets list of faqs from database
    db = get_db()
    execute = db.execute("SELECT * FROM FAQ;")

    faqs = execute.fetchall()

    if len(faqs) == 0:
        return None

    return faqs