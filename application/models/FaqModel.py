from framework.Database import get_db

def getFaqs():
    db = get_db()

    execute = db.execute("SELECT * FROM FAQ;")

    faqs = [dict(row) for row in execute.fetchall()]

    return faqs