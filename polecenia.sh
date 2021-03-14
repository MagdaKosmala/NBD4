#!/bin/bash


#1. Umieść w bazie (nazwa bucketa ma być Twoim numerem indeksu poprzedzonym literą „s”) 5 wartości, gdzie każda z nich ma być dokumentem json mającym 4 pola co najmniej dwóch różnych typów.

curl -XPOST -i -H "Content-Type: application/json" -d '{"name": "Jane Doe", "nationality": "USA", "email": "jane@email.com", "gender":"Female"}' http://localhost:8098/buckets/s13568/keys/1 > wynik1.txt

curl -XPOST -i -H "Content-Type: application/json" -d '{"name": "Joe Doe", "nationality": "Australia", "email": "joe@email.com", "gender":"Male"}' http://localhost:8098/buckets/s13568/keys/2 >> wynik1.txt

curl -XPOST -i -H "Content-Type: application/json" -d'{"name": "Jan Kowalski", "nationality": "Poland", "email": "jan@email.com", "gender":"Male"}' http://localhost:8098/buckets/s13568/keys/3 >> wynik1.txt

curl -XPOST -i -H "Content-Type: application/json" -d '{"name": "Anna Nowak", "nationality": "Poland", "email": "anna@email.com", "gender":"Female"}' http://localhost:8098/buckets/s13568/keys/4 >> wynik1.txt


#2.Pobierz z bazy jedną z dodanych przez Ciebie wartości.

curl -i http://localhost:8098/buckets/s13568/keys/1 > wynik2.txt


#3.Zmodyfikuj jedną z wartości – dodając dodatkowe pole do dokumentu. 

curl -XPUT -i -H -i -H "Content-Type: application/json" -d '{"name": "Anna Nowak", "nationality": "Poland", "email": "anna@email.com", "gender":"Female", "mobile":"11221133"}' http://localhost:8098/buckets/s13568/keys/4 > wynik3.txt


#4.Zmodyfikuj jedną z wartości – usuwając jedną pole z wybranego dokumentu.

curl -XPUT -i -H "Content-Type: application/json" -d '{"name": "Jan Kowalski", "nationality": "Poland", "email": "jan@email.com"}' http://localhost:8098/buckets/s13568/keys/3 > wynik4.txt


#5.Zmodyfikuj jedną z wartości – zmieniając wartość jednego z pól. 

curl -XPUT -i -H "Content-Type: application/json" -d '{"name": "Joe Doe", "nationality": "Australia", "email": "updated.email@email.com", "gender":"Male"}'  http://localhost:8098/buckets/s13568/keys/2 > wynik5.txt



#6.Usuń jeden z dokumentów z bazy. 

curl -i -H "Content-Type: application/json" -XDELETE http://localhost:8098/buckets/s13568/keys/5 > wynik6.txt


#7.Spróbuj pobrać z bazy wartość, która nie istnieje w tej bazie. 

curl -i http://localhost:8098/buckets/s13568/keys/5 > wynik7.txt


#8.Dodaj do bazy 1 dokument json (zawierający 1 pole), ale nie specyfikuj klucza.

curl -XPOST -i -H "Content-Type: application/json" -d '{"country": "Poland"}' http://localhost:8098/buckets/s13568/keys > wynik8.txt


#9.Pobierz z bazy element z zadania 8. 

curl -i -H "Content-Type: application/json" http://localhost:8098/buckets/s13568/keys/SgMHBymwpPbtO4nzUcOl4MtXzrU > wynik9.txt


#10.Usuń z bazy element z zadania 8. 

curl -i -H "Content-Type: application/json" -XDELETE http://localhost:8098/buckets/s13568/keys/SgMHBymwpPbtO4nzUcOl4MtXzrU > wynik10.txt

