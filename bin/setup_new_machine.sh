
###############################################################################
# Atom                                                                        #
###############################################################################


# Atom editor settings
echo -n "Copying Atom settings.."
mv -f ~/.atom ~/dotfiles_old/
ln -s $HOME/dotfiles/atom ~/.atom
echo "done"

# Install personal packages
apm install --packages-file $HOME/.atom/packages.list
