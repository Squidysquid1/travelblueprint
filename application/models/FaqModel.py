from framework.Database import get_db

def getFaqs():
    db = get_db()
    execute = db.execute("SELECT * FROM FAQ;")

    faqs = []
    faqs = execute.fetchall()

    return faqs