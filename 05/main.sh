if ! [[ -d $1 && ${1: -1} == "/" ]]; then
    echo "Directory does not exist or wrong input. Parameter must end with '/'"
    exit 1
fi

echo "Total number of folders (including all nested ones) = $(find $1 -type d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
count=1
while read -ra top_dirs; do
    echo "$count - ${top_dirs[1]}, ${top_dirs[0]}"
    count=$(expr $count + 1)
done < <(du -h $1 | sort -rh | head -5)

echo "Total number of files = $(find $1 -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find $1 -name '*.conf' | wc -l) "
echo "Text files = $(find $1 -type f -name '*.txt' | wc -l)"
echo "Executable files = $(find $1 -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(find $1 -type f -name '*.log' | wc -l)"
echo "Archive files = $(find $1 -type f -regex '.*\(tar\|zip\|gz\|rar\)' | wc -l)"
echo "Symbolic links = $(find $1 -type l | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
find $1 -type f -exec du -BM {} + | sort -nr | head -10 | awk '{print $2", "$1", "$2}' | sed -e 's/, \(\.\|\/\).*\./ /' | awk '{print NR" - "$1" "$2"B, "$3}'
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | cat -n | awk '{print $1" - "$3", "$2}'