import string
import riak

client = riak.RiakClient(pb_port=8087, protocol='pbc')

sBucket = client.bucket('s13568')
person = {'full_name': 'John Doe',
           'email': 'doe@email.com',
           'country': 'USA'}

document = sBucket.new(person["email"], data=person).store()
docKey = document.key

print("Nowy dokument dodany do bazy z kluczem: " + str(docKey))
print("Dane: "+ str(document.data))

personDoc = sBucket.get(docKey)
data = personDoc.data
print("Pobrany document z bazy: " + str(data))

data["full_name"] = 'John Patrick Doe Jr'
data["mobile"] = '11223344'
personDoc.data = data
personDoc.store()

updatedPerson = sBucket.get(docKey)
print("Zmodyfikowany pobrany document z bazy:" + str(updatedPerson.data))

key = updatedPerson.key
sBucket.delete(key)

print("Proba pobrania usunietego documentu z bazy: " + str(sBucket.get(key).data))
