cat ./tables | xargs -I{} -n1 psql -h localhost -U root crane -c 'select * from applied_taxes where false' | head -1 | string replace -a ' |' ','
