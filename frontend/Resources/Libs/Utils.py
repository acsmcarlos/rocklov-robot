from faker import Faker
faker = Faker()

def nome_do_print():
    return faker.sha1()