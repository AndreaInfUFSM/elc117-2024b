people = [{'name': 'John', 'age': 25}, {'name': 'Jane', 'age': 30}, {'name': 'Doe', 'age': 22}]

sorted_people = sorted(people, key=lambda person: person['age'])

print(sorted_people)

