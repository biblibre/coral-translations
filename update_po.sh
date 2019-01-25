dest="../../coral-translations"
for module in "organizations" "usage" "licensing" "reports" "auth" "resources" "management" "install"; do
echo "module $module";
cd $module
echo $(pwd);
find . -maxdepth 3 -iname '*.php' -o -iname '*.js' | grep -v "plugins" | xargs xgettext --from-code=UTF-8 -o locale/templates/templates.pot
cp -v locale/templates/templates.pot $dest/$module/locale/templates/templates.pot
for locale in "de_DE" "fr_FR" "tr_TR" "zh_CN" "zh_TW"; do
echo "updating $locale"
msgmerge --update locale/$locale/LC_MESSAGES/messages.po locale/templates.pot
mkdir -pv "$dest/$module/locale/$locale/LC_MESSAGES"
cp -v locale/$locale/LC_MESSAGES/messages.po $dest/$module/locale/$locale/LC_MESSAGES/messages.po
done
cd ..
read -p "Press any key..."
done

# Special case: root directory (should be moved, and all po files should be merged anyway)
echo 'root directory';
module="."
dest="../coral-translations"
find . -maxdepth 1 -iname '*.php' -o -iname '*.js' | grep -v "plugins" | xargs xgettext --from-code=UTF-8 -o locale/templates/templates.pot
cp -v locale/templates/templates.pot $dest/$module/locale/templates/templates.pot
for locale in "de_DE" "fr_FR" "tr_TR" "zh_CN" "zh_TW"; do
echo "updating $locale"
msgmerge --update locale/$locale/LC_MESSAGES/messages.po locale/templates.pot
mkdir -pv "$dest/$module/locale/$locale/LC_MESSAGES"
cp -v locale/$locale/LC_MESSAGES/messages.po $dest/$module/locale/$locale/LC_MESSAGES/messages.po
done

