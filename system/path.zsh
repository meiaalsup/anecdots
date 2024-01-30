# Define the list of directories you wish to add to PATH
directories=(
  /usr/local/opt
  /usr/local/bin
  /usr/local/sbin
  $HOME/bin
  $HOME/.local/bin
  $(brew --prefix)/opt/python@3/libexec/bin
)

# Add them to the PATH
for dir in "${directories[@]}" ; do
  PATH="$dir:$PATH"
done

export PATH
