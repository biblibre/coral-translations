source="/home/pootle/pootle/env/lib/python2.7/site-packages/pootle/translations";
for module in "organizations" "usage" "licensing" "reports" "auth" "resources" "management" "install"; do
cp -Rv $source/$module/* ./$module/locale/
done;
cp -Rv $source/root/* ./locale/
