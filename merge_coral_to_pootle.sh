dest="../pootle/env/lib/python2.7/site-packages/pootle/translations/"
tmpdest="../tmp/"
languages="de_DE en_GB es fr_FR tr_TR zh_CN zh_TW"
for module in "organizations" "usage" "licensing" "reports" "auth" "resources" "management" "install"; do
echo "module $module";
for locale in $languages; do
echo "updating $locale"
msgmerge $module/locale/$locale/LC_MESSAGES/messages.po $dest/$module/$locale/LC_MESSAGES/messages.po -o $dest/$module/$locale/LC_MESSAGES/messages.po
done
done
#Root dir
echo 'root directory';
for locale in $languages; do
echo "updating $locale"
msgmerge $module/locale/$locale/LC_MESSAGES/messages.po $dest/$module/$locale/LC_MESSAGES/messages.po -o $dest/root/$locale/LC_MESSAGES/messages.po
done
