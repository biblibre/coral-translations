dest="../../coral-translations"
for module in "organizations" "usage" "licensing" "reports" "auth" "resources" "management"; do
echo "module $module";
cd $module
for locale in "de_DE" "fr_FR" "tr_TR" "zh_CN" "zh_TW"; do
echo "updating $locale"
echo '' > messages.po
find . -maxdepth 3 -iname '*.php' -o -iname '*.js' | grep -v "plugins" | xgettext --from-code=UTF-8 -j -f -
msgmerge -q -N locale/$locale/LC_MESSAGES/messages.po messages.po > new.po
mv new.po locale/$locale/LC_MESSAGES/messages.po
mkdir -pv "$dest/$module/locale/$locale/LC_MESSAGES"
cp -v locale/$locale/LC_MESSAGES/messages.po $dest/$module/locale/$locale/LC_MESSAGES/messages.po
rm messages.po
done
cd ..
done

# Special case: root directory (should be moved, and all po files should be merged anyway)
echo 'root directory';
module="."
dest="../coral-translations"
for locale in "de_DE" "fr_FR" "tr_TR" "zh_CN" "zh_TW"; do
echo "updating $locale"
echo '' > messages.po
find . -maxdepth 3 -iname '*.php' -o -iname '*.js' | grep -v "plugins" | xgettext --from-code=UTF-8 -j -f -
msgmerge -q -N locale/$locale/LC_MESSAGES/messages.po messages.po > new.po
mv new.po locale/$locale/LC_MESSAGES/messages.po
mkdir -pv "$dest/$module/locale/$locale/LC_MESSAGES"
cp -v locale/$locale/LC_MESSAGES/messages.po $dest/$module/locale/$locale/LC_MESSAGES/messages.po
rm messages.po
done

