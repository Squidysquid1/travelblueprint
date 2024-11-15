from framework.Database import get_db

def getFaqs():
    db = get_db()
    execute = db.execute("SELECT * FROM FAQ;")

    faqs = execute.fetchall()

    if len(faqs) == 0:
        return None

    return faqs