echo "$pysession" > pagermaid.session
sed -i "s#ID_HERE#$appid#g" config.yml;
sed -i "s#HASH_HERE#$apphash#g" config.yml;